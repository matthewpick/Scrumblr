class User < ActiveRecord::Base

  attr_accessible :user_id, :user_first_name, :user_last_name, :user_email, :user_velocity

  has_and_belongs_to_many :stories
  has_and_belongs_to_many :projects

  def get_assigned_stories

  end

  def assign_story

  end

end
