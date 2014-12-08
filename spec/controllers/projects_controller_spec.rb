require 'spec_helper'
require 'rails_helper'

describe ProjectsController do
  describe 'showing a particular project' do
    it 'should return all the sprint info as json' do
      @fake_sprint = Sprint.create! Hash[:sprint_start_date => Date.new(2014,11,7), :sprint_end_date => Date.new(2014,11,21)]
      @fake_project = Project.create!(Hash[:project_name => 'Dummy Name', :project_description => 'Description', :project_github => 'git@github/dummy'])
      @fake_project.sprints << @fake_sprint
      get :show, {:id => 1}
      expect(assigns(:sprints)).to eq(Project.find('1').sprints)
      expect(assigns(:info_array)).to eq([{"id" => @fake_sprint.id, "project_id" => @fake_sprint.project_id, "sprint_start_date" => @fake_sprint.sprint_start_date, 
                                           "velocity" => @fake_sprint.calculate_velocity, "sprint_end_date" => @fake_sprint.sprint_end_date, "discussions" => @fake_sprint.count_discussions,
                                           "story_total" => @fake_sprint.stories.count, "stories_completed" => @fake_sprint.count_completed_stories, "task_total" => @fake_sprint.count_tasks,
                                           "tasks_completed" => @fake_sprint.count_completed_tasks }])
    end
  end
  
  describe 'creating a new project' do
    it 'should create a new project with the given parameters' do
      @project = Hash[:project_name => 'something', :project_description => 'something', :project_github => 'something']
      @fake_project = Project.new(@project)
      @user = User.create!({:name => 'David', :provider => 'github', :uid => '', :session_token => ''})      
      expect(controller).to receive(:current_user).and_return(@user).twice
      expect(Project).to receive(:create!).with(@project).and_return(@fake_project)
      post :create, {:project => @project}  
    end
    
    it 'should redirect to the project dashboard' do
      post :create, {:project => {:project_name => 'something', :project_description => 'something', :project_github => 'something'}}
      expect(response).to redirect_to '/projects'
    end
  end
  
  describe 'showing the project dashboard' do
    it 'should create a hash of teams for each project' do
      @fake_user = User.create!({:name => 'David', :provider => 'github', :uid => '', :session_token => ''})
      @fake_user2 = User.create!({:name => 'Maximus', :provider => 'github', :uid => '', :session_token => ''})
      @fake_project = Project.create!(Hash[:project_name => 'Dummy Name', :project_description => 'Description', :project_github => 'git@github/dummy'])
      @fake_user.projects << @fake_project
      @fake_user2.projects << @fake_project
      
      expect(controller).to receive(:current_user).and_return(@fake_user).at_least(3).times
      get :index
      expect(assigns(:teams)).to eq({@fake_project.id => [@fake_user2]})
      
    end
  end
  
  describe 'showing my stories within a project' do
    it 'should make an array of my stories and the name of the project available to the view' do
      @fake_user = User.create!({:name => 'David', :provider => 'github', :uid => '', :session_token => ''})
      @fake_project = Project.create!(Hash[:project_name => 'Dummy Name', :project_description => 'Description', :project_github => 'git@github/dummy'])
      @fake_story = Story.create!(Hash[:story_name => 'test', :story_description => 'this is a test', :story_points => 1, :story_status => 'started'])
      @fake_user.stories << @fake_story
      @fake_project.stories << @fake_story
      
      expect(controller).to receive(:current_user).and_return(@fake_user).at_least(2).times
      get :my_project_stories, {:project_id => 1}
      expect(assigns(:project_name)).to eq(Project.find('1').project_name)
      expect(assigns(:stories)).to eq([@fake_story])
    end
    
    it 'should render the my_project_stories page' do
      get :my_project_stories, {:project_id => 1}
      expect(response).to render_template('my_project_stories')
    end
  end
end
