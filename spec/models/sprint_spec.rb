require 'spec_helper'
require 'rails_helper'

describe Sprint do
	describe 'creating a new sprint' do
		before :each do
			load Rails.root + 'db/seeds.rb'
			@fake_hash = Hash[:sprint_start_date => DateTime.new(2014, 11, 4), :sprint_end_date => DateTime.new(2014, 11, 11)]
			@fake_sprint = Sprint.new(@fake_hash)
			@fake_project_id = 1
		end
	
		it 'should create a new Sprint ActiveRecord object' do						
			expect(Sprint).to receive(:new).with(@fake_hash).and_return(@fake_sprint)
			Sprint.create_sprint(@fake_hash, @fake_project_id)
		end
		it 'should commit the sprint to the database' do
			allow(Sprint).to receive(:new).with(@fake_hash).and_return(@fake_sprint)
			expect(@fake_sprint).to receive(:save)
			Sprint.create_sprint(@fake_hash, @fake_project_id)
		end
	end
		
	describe 'assigning a start date to the sprint' do
		before :each do 
			load Rails.root + 'db/seeds.rb'
			@fake_sprint_id = 1
			@fake_start_date = DateTime.new(2014,11,4)
			@fake_sprint = Sprint.find(1)
		end
		
		it 'should find the correct sprint from the database' do
			expect(Sprint).to receive(:find).with(@fake_sprint_id).and_return(@fake_sprint)
			Sprint.assign_start_date(@fake_start_date, @fake_sprint_id)
		end
		it 'should assign the given date as the start date' do
			allow(Sprint).to receive(:find).with(@fake_sprint_id).and_return(@fake_sprint)
			expect(@fake_sprint).to receive(:sprint_start_date=).with(@fake_start_date)
			Sprint.assign_start_date(@fake_start_date, @fake_sprint_id)
		end
		it 'should update the Sprint table' do
			allow(Sprint).to receive(:find).with(@fake_sprint_id).and_return(@fake_sprint)
			allow(@fake_sprint).to receive(:sprint_start_date=).with(@fake_start_date)
			expect(@fake_sprint).to receive(:save)
			Sprint.assign_start_date(@fake_start_date, @fake_sprint_id)
		end
	end
		
	describe 'assigning an end date to the sprint' do
		before :each do
			load Rails.root + 'db/seeds.rb'
			@fake_sprint_id = 1
			@fake_end_date = DateTime.new(2014,11,11)
			@fake_sprint = Sprint.find(1)
		end
		
		it 'should find the correct sprint form the database' do 
			expect(Sprint).to receive(:find).with(@fake_sprint_id).and_return(@fake_sprint)
			Sprint.assign_end_date(@fake_end_date, @fake_sprint_id)
		end
		it 'should assign the given date as the end date' do 
			allow(Sprint).to receive(:find).with(@fake_sprint_id).and_return(@fake_sprint)
			expect(@fake_sprint).to receive(:sprint_end_date=).with(@fake_end_date)
			Sprint.assign_end_date(@fake_end_date, @fake_sprint_id)
		end
		it 'should update the Sprint table' do
			allow(Sprint).to receive(:find).with(@fake_sprint_id).and_return(@fake_sprint)
			allow(@fake_sprint).to receive(:sprint_end_date=).with(@fake_end_date)
			expect(@fake_sprint).to receive(:save)
			Sprint.assign_end_date(@fake_end_date, @fake_sprint_id)
		end
	end
		
	describe 'calculating the sprint velocity' do
		before :each do
			load Rails.root + 'db/seeds.rb'
			@fake_sprint_id = 1
			@fake_sprint = Sprint.find(1)
			@fake_story = Story.find(1)
		end
		it 'should find the correct sprint from the database' do
			expect(Sprint).to receive(:find).with(@fake_sprint_id).and_return(@fake_sprint)
			Sprint.calculate_velocity(@fake_sprint_id)
		end
		it 'should get the stories of the sprint' do
			allow(Sprint).to receive(:find).with(@fake_sprint_id).and_return(@fake_sprint)
			expect(@fake_sprint).to receive(:stories).and_return(Array[@fake_story])
			Sprint.calculate_velocity(@fake_sprint_id)
		end
		it 'should return the velocity of the sprint' do
			allow(Sprint).to receive(:find).with(@fake_sprint_id).and_return(@fake_sprint)
			allow(@fake_sprint).to receive(:stories).and_return(Array[@fake_story])
			velocity = Sprint.calculate_velocity(@fake_sprint_id)
			expect(velocity).to be_a(Integer)
		end
	end
		
	describe 'assigning a story to a sprint' do
		before :each do
			load Rails.root + 'db/seeds.rb'
			@fake_sprint_id = 1
			@fake_sprint = Sprint.find(1)
			@fake_story_id = 1
			@fake_story = Story.find(1)
		end
		it 'should find the correct sprint from the database' do
			expect(Sprint).to receive(:find).with(@fake_sprint_id).and_return(@fake_sprint)
			Sprint.assign_story(@fake_story_id,@fake_sprint_id)
		end
		it 'should assign the given story to the sprint' do
			allow(Sprint).to receive(:find).with(@fake_sprint_id).and_return(@fake_sprint)
			expect(Story).to receive(:find).with(@fake_story_id).and_return(@fake_story)
			Sprint.assign_story(@fake_story_id, @fake_sprint_id)
		end
	end
		
	describe 'getting the stories of the sprint' do
		before :each do
			load Rails.root + 'db/seeds.rb'
			@fake_sprint_id = 1
			@fake_sprint = Sprint.find(1)
		end
		it 'should find the correct sprint from the database' do
			expect(Sprint).to receive(:find).with(@fake_sprint_id).and_return(@fake_sprint)
			Sprint.get_stories(@fake_sprint_id)
		end
		it 'should return the stories of the sprint' do
			allow(Sprint).to receive(:find).with(@fake_sprint_id).and_return(@fake_sprint)
			expect(@fake_sprint).to receive(:stories)
			Sprint.get_stories(@fake_sprint_id)
		end
	end
end
