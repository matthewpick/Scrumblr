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
      
      @projects.each do |project|
        @teams[project.id] = project.get_team(current_user.id)
      end
    end    
  end

  def show
    project_id = params[:id]
    @info_array = []
    @sprints = Project.find(project_id).sprints
    
    @sprints.each do |sprint|
      @info_array << {:id => sprint.id, :project_id => sprint.project_id, :sprint_start_date => sprint.sprint_start_date, 
                      :sprint_end_date => sprint.sprint_end_date, :discussions => sprint.count_discussions}
    end
    
    render :json => @info_array
  end
end
