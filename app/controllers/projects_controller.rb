class ProjectsController < ApplicationController
	before_filter :set_current_user
	
	def create
		project = params[:project]
		name = project[:project_name]
		desc = project[:project_description]
		repo = project[:project_github]
		#param = 'Scrumblr'
		flash[:notice] = "will create project with name #{name}, description #{desc}, and repository #{repo}"
		@current_user.projects << Project.create!(project)
		redirect_to projects_path
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
    
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
