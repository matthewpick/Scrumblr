class StorysController < ApplicationController
	before_filter :set_current_user
	
	def create
    #@story = Story.create!(params[:story])
	  #render json: @story
    @sprint = Sprint.find params[:sprint_id]
    if @sprint!= nil
      @story = Story.create!(params[:story])
      @story.project_id = @sprint.project_id
      @story.save
      @sprint.stories << @story
    end
    redirect_to project_sprint_scrumboard_path(@sprint.project_id, @sprint.id)
  end

  def update
    @story = Story.find params[:story][:id]
    @story.update_attributes!(params[:story])
    render json: @story
  end

  def destroy
    Story.delete params[:id]
    redirect_to :back
  end

  def index
    render json: Story.all
  end

  def show
    @storys = Story.find params[:storyId]
    render json: @storys
  end

end
