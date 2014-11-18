class SprintsController < ApplicationController

	def create
		# updates the DB with a new sprint
		# responds to an AJAX request?
		project_id = params[:project_id]
		sprint_info = params[:sprint_info]
		@sprint = Sprint.create!(sprint_info)
		Project.find(project_id).sprints << @sprint
		
		@info_array = []
		@sprints = Project.find(project_id).sprints
		
		@sprints.each do |sprint|
      @info_array << {:id => sprint.id, :project_id => sprint.project_id, :sprint_start_date => sprint.sprint_start_date, 
                      :sprint_end_date => sprint.sprint_end_date, :discussions => sprint.count_discussions}
    end
    
		render json: @info_array
	end
	
	def new
		# return a partial that allows the user to create/submit a new sprint
	end

  def update
  	# updates the info for an existing sprint within the DB
  	sprint_id = params[:id]
  	@sprint = Sprint.find(sprint_id)
  	@sprint.update_attributes(params[:sprint])
  end

  def edit
  	# render a view allowing the user to change sprint start/end dates
  end

  def destroy
  
  end

  def index
    project_id = params[:project_id]
    @sprints = Project.find(project_id).sprints
    
    respond_to do |format|
      format.json {render json: @sprints and return}
    end    
  end

  def show
=begin
  	 show a particular sprint -- render scrumboard view
  	 data scrumboard will need:
  	 the current project's title
  	 all the sprints for the current project
  	 all the stories for the selected sprint
  	 all the tasks for each story
=end
    sprint_id = params[:id]
    @current_sprint = Sprint.find(sprint_id)
    @stories = @current_sprint.stories
    @tasks = Array[]
    
    @stories.each do |story|
      @tasks << story.tasks
    end
    
  end
  
end
