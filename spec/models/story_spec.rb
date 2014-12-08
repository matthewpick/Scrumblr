require 'spec_helper'
require 'rails_helper'

describe Story do
  before :each do
      #load Rails.root + 'db/seeds.rb'
      @info = Hash[:story_points => 3, :story_description => 'fake', :story_status => 'fake']
      @fake_task = Task.create Hash[:title=>'title', :points=>1, :status=>'backlog', :needs_discussion=>true, :description=>'text' ]
      @fake_task2 = Task.create Hash[:title=>'title', :points=>3, :status=>'completed', :needs_discussion=>false, :description=>'text' ]
      @fake_story = Story.create Hash[:story_name => 'fake', :story_points => 3, :story_description => 'fake', :story_status => 'fake']
      @fake_story.tasks << @fake_task
      @fake_story.tasks << @fake_task2
  end
  describe 'Creating a new Story' do
    it 'Should be able to add a task' do
      @fake_story.add_task(@fake_task)
      expect(@fake_story.tasks).to include(@fake_task)
    end
  end
    
  describe 'calculating story points' do
    it 'should be the sum of all task points of that story' do
      points = @fake_story.calculate_points
      expect(points).to eq(4)
    end
  end
  
  describe 'counting discussions' do
    it 'should return the number of tasks marked for discussion' do
      expect(@fake_story.count_discussions).to eq(1)      
    end
  end
  
  describe 'checking to see if the story is completed' do
    it 'should return true iff all that storys tasks are completed' do
      @fake_story2 = Story.create Hash[:story_name => 'fake', :story_points => 3, :story_description => 'fake', :story_status => 'fake']
      @fake_task3 = Task.create Hash[:title=>'title', :points=>3, :status=>'completed', :needs_discussion=>false, :description=>'text' ]
      @fake_task4 = Task.create Hash[:title=>'title', :points=>3, :status=>'completed', :needs_discussion=>false, :description=>'text' ]
      @fake_story2.tasks << @fake_task3
      @fake_story2.tasks << @fake_task4
      
      expect(@fake_story.completed?).to eq(false)
      expect(@fake_story2.completed?).to eq(true)
    end
    
    it 'should return false if the story has no tasks' do
      @fake_story3 = Story.create Hash[:story_name => 'fake', :story_points => 3, :story_description => 'fake', :story_status => 'fake']
      expect(@fake_story3.completed?).to eq(false)
    end
  end
  
  describe 'counting completed tasks' do
    it 'should return the number of completed tasks within the story' do
      expect(@fake_story.count_completed_tasks).to eq(1)
    end
  end
 
  describe 'trying to add a story without a name' do
    it 'should not be a valid story' do
      expect(Story.new(@info)).to_not be_valid
    end
  end
end
