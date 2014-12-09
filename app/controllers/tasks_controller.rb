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

  def move_left
    @task = Task.find params[:task_id]
    if @task.status == 'in_progress'
      @task.status = 'backlog'
    elsif @task.status == 'in_review'
      @task.status = 'in_progress'
    elsif @task.status == 'completed'
      @task.status = 'in_review'
    end
    @task.save
    redirect_to :back
  end

  def move_right
    @task = Task.find params[:task_id]
    if @task.status == 'backlog'
      @task.status= 'in_progress'
    elsif @task.status == 'in_progress'
      @task.status = 'in_review'
    elsif @task.status == 'in_review'
      @task.status = 'completed'
    end
    @task.save
    redirect_to :back
  end

end
