class TasksController < ApplicationController
  def create
    @story = Story.find params[:story_id]
    #TODO check that the story is in DB
    if @story != nil
      @task = @story.build params[:task]
    end
    redirect_to(story_path @story)
  end

  def update
    @task = Task.find params[:task_id]
    @task.update_attributes params[:task]
    redirect_to root_path
  end

  def edit
    @task = Task.find params[:task_id]
    render :json => @task
  end

  def destroy
    @task = Task.find params[:task_id]
    @task.destroy
    redirect_to root_path
  end

  def index
    @story = Story.find params[:story_id]
    @tasks  = @story.tasks
    render :json => @tasks
  end

  def show
    @task = Task.find params[:task_id]
    render :json => @task
  end
end
