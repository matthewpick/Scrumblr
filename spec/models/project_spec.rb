require 'spec_helper'
require 'rails_helper'

describe Project do
   before :each do
      #load Rails.root + 'db/seeds.rb'
      @fake_hash = Hash[:project_name => 'Dummy Name', :project_description => 'Description', :project_github => 'git@github/dummy']
      @fake_project = Project.new(@fake_hash)
      @fake_sprint = Sprint.new Hash[:sprint_start_date => Date.new(2014,11,7), :sprint_end_date => Date.new(2014,11,21)]
      @fake_sprint2 = Sprint.new Hash[:sprint_start_date => Date.new(2014,11,22), :sprint_end_date => Date.new(2014,11,29)]
      @fake_project.sprints << @fake_sprint
      @fake_project.sprints << @fake_sprint2
      @fake_story = Story.new Hash[:story_name => 'fake', :story_description => 'this is a test', :story_points => 1, :story_status => 'started']
		  @fake_story2 = Story.new Hash[:story_name => 'fake2', :story_description => 'this is a test', :story_points => 2, :story_status => 'started']
		  @fake_sprint.stories << @fake_story
		  @fake_sprint2.stories << @fake_story2
		  @fake_task = Task.new Hash[:title => 'task', :points => 1, :status => 'completed', :description => 'this is a test', :needs_discussion => true]
		  @fake_task2 = Task.new Hash[:title => 'task', :points => 2, :status => 'completed', :description => 'this is a test', :needs_discussion => true]
		  @fake_story.tasks << @fake_task
		  @fake_story2.tasks << @fake_task2
		  @fake_project.save
   end
   describe 'creating a new project' do
      
      it 'should create a new Project Object' do
         expect(Project).to receive(:new).with(@fake_hash).and_return(@fake_project)
         Project.create_project(@fake_hash)
      end
   end

   describe 'assigning users to a project' do
   end

   describe 'getting the users of a project' do
   end

   describe 'adding sprints to a project' do
   end
   
   describe 'getting the sprints for a project' do
   end
   
   describe 'calculating the average sprint velocity' do
     it 'should return the average of velocities across all sprints' do
       expect(@fake_project.sprints.count).to eq(2)
       expect(@fake_project.average_velocity).to eq(1.5)
     end
   end
end
