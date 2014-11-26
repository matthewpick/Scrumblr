class User < ActiveRecord::Base

  attr_accessible :name, :provider, :uid, :session_token, :user_velocity

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
      user.session_token = SecureRandom.urlsafe_base64

      puts 'User...'
      puts user.inspect
      puts 'Auth...'
      puts auth.inspect
    end
  end

end
