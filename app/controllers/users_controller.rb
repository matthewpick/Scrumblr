class UsersController < ApplicationController
  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
  end

  def show
  end
  
  def invite
    email = params[:email]
    project_id = params[:project_id]
    
    if User.where(:email => email).any?   
      if User.find_by_email(email).invites.include?(Project.find(project_id))  
        flash[:notice] = "#{email} has already been invited #{Project.find(project_id).project_name}!"
      elsif Project.find(project_id).users.include?(User.find_by_email(email))
        flash[:notice] = "#{email} is already a member of #{Project.find(project_id).project_name}!"
      else 
        User.find_by_email(email).invites << Project.find(project_id)
      end
    else
      flash[:notice] = "User with email: #{email} not found!"
    end
    
    redirect_to projects_path
  end
  
  def respond
    if current_user
      answer = params[:answer].to_i
      project_id = params[:project_id]
      
      if answer == 1
        current_user.projects << Project.find(project_id)
      end
      
      current_user.invites.delete(Project.find(project_id))
      redirect_to projects_path
    end
  end
end
