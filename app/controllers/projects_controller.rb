class ProjectsController < ApplicationController
	before_filter :set_current_user
	
	def create
		project = params[:project]
		if current_user
		  @new_project = Project.new(project)
		  
		  if @new_project.valid?
		    current_user.projects << Project.create!(project)
		    flash[:notice] = "#{@new_project.project_name} successfully created"
		  else
		    flash[:notice] = "Project name can't be blank"
		  end
		end
		
	 redirect_to projects_path
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
    if current_user
      @teams = {}
      @projects = current_user.projects
      @velocities = {}
      
      @projects.each do |project|
        @teams[project.id] = project.get_team(current_user.id)
        @velocities[project.id] = current_user.my_project_velocity(project.id)
      end
    end    
  end

  def show
    project_id = params[:id]
    @info_array = []
    @sprints = Project.find(project_id).sprints
    
    @sprints.each do |sprint|
      @info_array << {:id => sprint.id, :project_id => sprint.project_id, :sprint_start_date => sprint.sprint_start_date, :velocity => sprint.calculate_velocity, 
                      :sprint_end_date => sprint.sprint_end_date, :discussions => sprint.count_discussions, :story_total => sprint.stories.count,
                      :stories_completed => sprint.count_completed_stories, :task_total => sprint.count_tasks, :tasks_completed => sprint.count_completed_tasks}
    end
    
    render :json => @info_array
  end
  
  def my_project_stories
    if current_user
      @stories = current_user.my_stories_in_project(params[:project_id])
      @project_name = Project.find(params[:project_id]).project_name
    end
  end
end
