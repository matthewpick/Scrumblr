require 'spec_helper'
require 'rails_helper'

describe SprintsController do
  before :each do
    load Rails.root + 'db/seeds.rb'
    @fake_sprint = Sprint.find(1)
    @fake_story = Story.create! Hash[:story_name => 'test', :story_points => 1, :story_status => 'completed', :story_description => 'this is a test']
    @fake_story2 = Story.create! Hash[:story_name => 'test2', :story_points => 1, :story_status => 'completed', :story_description => 'this is a test2']
    @fake_task = Task.create! Hash[:title => 'test', :description => 'this is a test', :needs_discussion => false, :points => 1, :status => 'completed']
    @fake_task2 = Task.create! Hash[:title => 'test2', :description => 'this is a test2', :needs_discussion => false, :points => 1, :status => 'completed']
    @fake_sprint.stories << @fake_story
    @fake_sprint.stories << @fake_story2
    @fake_story.tasks << @fake_task
    @fake_story2.tasks << @fake_task2

		
  end
  
  it 'should make sprint data available to scrum board view' do      
    allow(Sprint).to receive(:find).with('1').and_return(@fake_sprint)
    get :show, {:user_id => 1, :project_id => 1, :id => 1}
    expect(assigns(:current_sprint)).to eq @fake_sprint
    expect(assigns(:stories)).to eq Array[@fake_story, @fake_story2]
    expect(assigns(:tasks)).to eq Array[[@fake_task], [@fake_task2]]
  end
end
