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
=begin
		it 'should assign the sprint to a project' do
			fake_hash = Hash[:sprint_start_date => DateTime.new(2014, 11, 4), :sprint_end_date => DateTime.new(2014, 11, 11)]
			fake_sprint = Sprint.new(fake_hash)
			fake_project_id = 1
			expect(Project.find(fake_project_id)).to receive(:sprints)
			Sprint.create_sprint(fake_hash, fake_project_id)
		end
=end
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
		it 'should find the correct sprint from the database'
		it 'should get the stories of the sprint'
		it 'should return the velocity of the sprint'
	end
		
	describe 'assigning a story to a sprint' do
		it 'should find the correct sprint from the database'
		it 'should assign the given story to the sprint'
	end
		
	describe 'getting the stories of the sprint' do
		before :each do
			load Rails.root + 'db/seeds.rb'
			
		end
		it 'should find the correct sprint from the database'
		it 'should return the stories of the sprint'
	end
end
