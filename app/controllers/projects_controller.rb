class ProjectsController < ApplicationController
	#before_filter :set_current_user
	
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
    @current_user = User.find(params[:user_id])
  	#@sample_user = User.find(1)
  end

  def show
    project_id = params[:id]
    @sprints = Project.find(project_id).sprints
    render :json => @sprints
  end
end
