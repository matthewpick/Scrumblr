require 'spec_helper'
require 'rails_helper'

describe User do
  before :each do
    @fake_user = User.create Hash[:name => 'fake', :provider => 'github', :uid => '212121', :session_token => '1']
    @fake_project = Project.create Hash[:project_name => 'test', :project_description => 'something', :project_github => 'git@github.com/test']
    @fake_sprint = Sprint.create Hash[:sprint_start_date => Date.new(2014,11,17), :sprint_end_date => Date.new(2014,11,24)]
    @fake_story = Story.create Hash[:story_name => 'test', :story_description => 'this is a test', :story_points => 1, :story_status => 'started']
    @fake_task = Task.create Hash[:title => 'task', :points => 1, :status => 'completed', :description => 'this is a test', :needs_discussion => false]
    @fake_story.tasks << @fake_task
    @fake_sprint.stories << @fake_story
    @fake_project.sprints << @fake_sprint
    @fake_project.stories << @fake_story
    @fake_user.projects << @fake_project
    @fake_user.stories << @fake_story  
  end
  
  describe 'getting my stories in a project' do
    it 'should return all my stories in a given project' do
      my_stories = @fake_user.my_stories_in_project(1)
      expect(my_stories).to eq([@fake_story]) 
    end
  end
  
  describe 'getting my project velocity' do
    it 'should return my total velocity for the project' do
      velocity = @fake_user.my_project_velocity(@fake_project.id)
      expect(velocity).to eq(1)
    end
  end
end
