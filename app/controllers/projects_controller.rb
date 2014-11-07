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
  	#@sample_user = User.find(1)
  end

  def show
  end
end
