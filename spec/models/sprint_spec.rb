require 'spec_helper'
require 'rails_helper'

describe Sprint do
	before :each do
		@info_hash = Hash[:sprint_start_date => DateTime.new(2014,11,7), :sprint_end_date => DateTime.new(2014,11,21)]
		@fake_sprint = Sprint.new(@info_hash)
		@fake_story = Story.new Hash[:story_name => 'fake', :story_description => 'this is a test', :story_points => 1, :story_status => 'started']
		@fake_story2 = Story.new Hash[:story_name => 'fake2', :story_description => 'this is a test', :story_points => 2, :story_status => 'started']
		@fake_sprint.stories << @fake_story
		@fake_sprint.stories << @fake_story2
	end
	
	describe 'creating a new sprint' do	
		it 'should create a new Sprint ActiveRecord object in the database' do
			expect(Sprint).to receive(:create!).with(@info_hash)						
			Sprint.create_sprint(@info_hash)		
		end
	end
		
	describe 'calculating the sprint velocity' do		
		it 'should return the sum of all story sprints' do
			velocity = @fake_sprint.calculate_velocity
			expect(velocity).to eq(3)
		end

	end
		
	describe 'adding a story to a sprint' do
		it 'should assign the given story to the sprint' do
			@fake_sprint.add_story(@fake_story)
			expect(@fake_sprint.stories).to include(@fake_story)
		end
	end
end
