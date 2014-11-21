class ProjectsController < ApplicationController
	before_filter :set_current_user
	
	def create
		project = params[:project]
		if @current_user
		  @current_user.projects << Project.create!(project)
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
    #if @current_user
      #@projects = @current_user.projects
    #end
    
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
