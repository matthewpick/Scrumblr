class SprintsController < ApplicationController

	def create
		# updates the DB with a new sprint
		# responds to an AJAX request?
	end
	
	def new
		# return a partial that allows the user to create/submit a new sprint
	end

  def update
  	# updates the info for an existing sprint within the DB
  end

  def edit
  	# render a view allowing the user to change sprint start/end dates
  end

  def destroy
  
  end

  def index

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
    
    @stories.each do |story|
      @tasks << story.tasks
    end
    
  end
  
end
