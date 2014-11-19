class User < ActiveRecord::Base

  attr_accessible :name, :provider, :uid, :session_token, :user_velocity

  before_save :create_session_token

  has_and_belongs_to_many :stories
  has_and_belongs_to_many :projects

  def get_assigned_stories

  end

  def assign_story

  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.name = auth['info']['name']
    end

  end

  def create_session_token
    self.session_token = SecureRandom.urlsafe_base64
  end

end
