class SprintsController < ApplicationController
  #before_filter :set_current_user
  
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
      @info_array << {:id => sprint.id, :project_id => sprint.project_id, :sprint_start_date => sprint.sprint_start_date, :velocity => sprint.calculate_velocity, 
                      :sprint_end_date => sprint.sprint_end_date, :discussions => sprint.count_discussions, :story_total => sprint.stories.count,
                      :stories_completed => sprint.count_completed_stories, :task_total => sprint.count_tasks, :tasks_completed => sprint.count_completed_tasks}
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
=begin
    project_id = params[:project_id]
    @sprints = Project.find(project_id).sprints
    
    respond_to do |format|
      format.json {render json: @sprints and return}
    end 
=end   
  end

  def show
    sprint_id = params[:id]
    @current_sprint = Sprint.find(sprint_id)
    @stories = @current_sprint.stories
    @tasks = Array[]
    
    @stories.each do |story|
      @tasks << story.tasks
    end
    
  end

  def scrumboard
    #render a view for the scrumboard
    @sprint = Sprint.find(params[:sprint_id])
    @sprint.stories.each do |story|
      @story_tasks = Task.find_all_by_story_id(story.id)
      @story_tasks.each do |task|
        story.tasks << task
      end
    end
    @sprint_list = Sprint.find_all_by_project_id(params[:project_id])
    @scrumboard = { :sprint => @sprint, :sprint_list => @sprint_list}
    
  end  
end
