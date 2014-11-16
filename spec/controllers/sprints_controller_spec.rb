require 'spec_helper'
require 'rails_helper'

describe SprintsController do
  before :each do
    load Rails.root + 'db/seeds.rb'
    @fake_sprint = Sprint.new Hash[:sprint_start_date => DateTime.new(2014,11,7), :sprint_end_date => DateTime.new(2014,11,21)]
    #@fake_sprint.save
    #@fake_sprint = Sprint.find_by_id(1)
    #@fake_sprint = double(
    @fake_story = Story.new Hash[:story_name => 'fake', :story_description => 'this is a test', :story_points => 1, :story_status => 'started']
		@fake_story2 = Story.new Hash[:story_name => 'fake2', :story_description => 'this is a test', :story_points => 2, :story_status => 'started']
		@fake_sprint.stories << @fake_story
		@fake_sprint.stories << @fake_story2
		@fake_task = Task.new Hash[:title => 'fake_task', :points => 1, :needs_discussion => false, :description => 'fake_description', :status => 'started' ]
		@fake_task2 = Task.new Hash[:title => 'fake_task2', :points => 2, :needs_discussion => true, :description => 'fake_description2', :status => 'started' ]
		@fake_story.tasks << @fake_task
		@fake_story2.tasks << @fake_task2
  end
  
  it 'should make sprint data available to scrum board view' do
=begin
    Sprint = double(Sprint)  
    allow(Sprint).to receive(:find).and_return(@fake_sprint)
    expect(assigns(:current_sprint)).to eq @fake_sprint
    expect(assigns(:stories)).to eq Array[@fake_story, @fake_story2]
    expect(assigns(:tasks)).to eq Array[@fake_task, @fake_task2]
    get :show, {:user_id => 1, :project_id => 1, :id => 1} 
    
=end 
  end
end
