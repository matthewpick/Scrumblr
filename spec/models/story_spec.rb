require 'spec_helper'
require 'rails_helper'

describe Story do
  before :each do
      #load Rails.root + 'db/seeds.rb'
      @info = Hash[:story_points => 3, :story_description => 'fake', :story_status => 'fake']
      @fake_task = Task.new Hash[:title=>'title', :points=>1, :status=>'backlog', :needs_discussion=>true, :description=>'text' ]
      @fake_task2 = Task.new Hash[:title=>'title', :points=>3, :status=>'backlog', :needs_discussion=>false, :description=>'text' ]
      @fake_story = Story.new Hash[:story_name => 'fake', :story_points => 3, :story_description => 'fake', :story_status => 'fake']
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
  
  describe 'trying to add a story without a name' do
    it 'should not be a valid story' do
      expect(Story.new(@info)).to_not be_valid
    end
  end
end
