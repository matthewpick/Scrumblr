class StorysController < ApplicationController
	before_filter :set_current_user
	
	def create
    @story = Story.create!(params[:story])
	  render json: @story
  end

  def update
    @story = Story.find params[:story][:id]
    @story.update_attributes!(params[:story])
    render json: @story
  end

  def destroy
    Story.delete params[:storyId]
  end

  def index
    render json: Story.all
  end

  def show
    @storys = Story.find params[:storyId]
    render json: @storys
  end

end
