class User < ActiveRecord::Base

  attr_accessible :name, :provider, :uid, :email, :image_url, :github_url, :session_token, :user_velocity

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

end
