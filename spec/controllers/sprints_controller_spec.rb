require 'spec_helper'
require 'rails_helper'

describe SprintsController do
  before :each do
    #load Rails.root + 'db/seeds.rb'
    @info = Hash[:sprint_start_date => Date.new(2014,11,7), :sprint_end_date => Date.new(2014,11,21)]
    @info2 = Hash[:sprint_start_date => Date.new(2014,11,7), :sprint_end_date => Date.new(2014,11,22)]
    @fake_project = Project.create!(Hash[:project_name => 'Dummy Name', :project_description => 'Description', :project_github => 'git@github/dummy'])
    #@fake_sprint = Sprint.find(1) 
    #@fake_project.sprints << @fake_sprint 
  end
  
  describe 'creating a new sprint' do
    it 'should create a new sprint and assign it to the appropriate project' do
      allow(Project).to receive(:find).with('1').and_return(@fake_project)
      post :create, {:project_id => 1, :sprint_info => @info}
      expect(assigns(:sprint)).to eq(Sprint.find(1))
      expect(@fake_project.sprints).to include(Sprint.find(1)) 
    end
    it 'should return an Array containing all the sprints and the number of discussions' do
      post :create, {:project_id => 1, :sprint_info => @info}
      @fake_sprint = Sprint.find(1)
      expect(assigns(:info_array)).to eq([{"id" => @fake_sprint.id, "project_id" => 1, "sprint_start_date" => @fake_sprint.sprint_start_date, 
                      "sprint_end_date" => @fake_sprint.sprint_end_date, "discussions" => @fake_sprint.count_discussions}])
      #expect(response).to eq(:info_array.to_json)
    end
  end
=begin  
  describe 'updating an existing sprint' do
    it 'should update the sprint with the received info' do
      @fake_sprint = Sprint.create!(@info)
      put :update, {:id => 1, :sprint => @info}
      expect(assigns(:sprint)).to eq(@fake_sprint)
      expect(@fake_sprint).to receive(:update_attributes).with(@info)
    end
  end
=end  
  describe 'showing a sprint' do
    it 'should make sprint data available to scrum board view' do 
      @fake_sprint = Sprint.create! Hash[:sprint_start_date => Date.new(2014,11,7), :sprint_end_date => Date.new(2014,11,21)]
      @fake_story = Story.create! Hash[:story_name => 'test', :story_points => 1, :story_status => 'completed', :story_description => 'this is a test']
      @fake_story2 = Story.create! Hash[:story_name => 'test2', :story_points => 1, :story_status => 'completed', :story_description => 'this is a test2']
      @fake_task = Task.create! Hash[:title => 'test', :description => 'this is a test', :needs_discussion => false, :points => 1, :status => 'completed']
      @fake_task2 = Task.create! Hash[:title => 'test2', :description => 'this is a test2', :needs_discussion => false, :points => 1, :status => 'completed']
      @fake_sprint.stories << @fake_story
      @fake_sprint.stories << @fake_story2
      @fake_story.tasks << @fake_task
      @fake_story2.tasks << @fake_task2     
      allow(Sprint).to receive(:find).with('1').and_return(@fake_sprint)
      get :show, {:user_id => 1, :project_id => 1, :id => 1}
      expect(assigns(:current_sprint)).to eq @fake_sprint
      expect(assigns(:stories)).to eq Array[@fake_story, @fake_story2]
      expect(assigns(:tasks)).to eq Array[[@fake_task], [@fake_task2]]
    end
  end
end
