class ProjectsController < ApplicationController
	def create
		project = params[:project]
		name = project[:name]
		desc = project[:description]
		repo = project[:repo]
		#param = 'Scrumblr'
		flash[:notice] = "will create project with name #{name}, description #{desc}, and repository #{repo}"
		redirect_to projects_path
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
  	@sample_user = User.find(1)
  end

  def show
  end
end
