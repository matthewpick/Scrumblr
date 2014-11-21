require 'spec_helper'
require 'rails_helper'

describe Sprint do
	before :each do
		@info = Hash[:sprint_start_date => Date.new(2014,11,7), :sprint_end_date => Date.new(2014,11,21)]
		@fake_sprint = Sprint.new(@info_hash)
		@info2 = Hash[:sprint_start_date => Date.new(2014,11,7), :sprint_end_date => Date.new(2014,11,6)]
		@fake_story = Story.new Hash[:story_name => 'fake', :story_description => 'this is a test', :story_points => 1, :story_status => 'started']
		@fake_story2 = Story.new Hash[:story_name => 'fake2', :story_description => 'this is a test', :story_points => 2, :story_status => 'started']
		@fake_sprint.stories << @fake_story
		@fake_sprint.stories << @fake_story2
		@fake_task = Task.new Hash[:title => 'task', :points => 1, :status => 'completed', :description => 'this is a test', :needs_discussion => true]
		@fake_task2 = Task.new Hash[:title => 'task', :points => 2, :status => 'completed', :description => 'this is a test', :needs_discussion => true]
		@fake_story.tasks << @fake_task
		@fake_story.tasks << @fake_task2
	end
	
	describe 'creating a new sprint' do	
		it 'should create a new Sprint ActiveRecord object in the database' do
			expect(Sprint).to receive(:create!).with(@info)						
			Sprint.create_sprint(@info)		
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
	
	describe 'calculating the number of discussions' do
	  it 'should return the number of tasks that are marked for discussion' do
	    discussions = @fake_sprint.count_discussions
	    expect(discussions).to eq(2)
	  end
	end
	
	describe 'trying to add a sprint with an end date before a start date' do
	  it 'should not be a valid sprint' do
	    expect(Sprint.new(@info2)).to_not be_valid
	  end
	end 
end
