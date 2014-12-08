class User < ActiveRecord::Base

  attr_accessible :name, :provider, :uid, :email, :github_username, :image_url, :github_url, :session_token, :user_velocity

  has_and_belongs_to_many :stories
  has_and_belongs_to_many :projects
  has_and_belongs_to_many :invites, :class_name => "Project", :join_table => "invites_projects"

  def get_assigned_stories

  end

  def assign_story

  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.name = auth['info']['name']
      user.session_token = SecureRandom.urlsafe_base64
    end
  end
  
  def my_stories_in_project(project_id)
    return Story.joins(:users, :project).where(projects: {id: project_id}, users: {id: self.id})
  end
  
  def my_project_velocity(project_id)
    my_velocity = 0
    my_stories = my_stories_in_project(project_id)
    
    my_stories.each do |story|
      my_velocity += story.calculate_points
    end
    
    return my_velocity
  end

end
