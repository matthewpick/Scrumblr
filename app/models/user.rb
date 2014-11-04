class User < ActiveRecord::Base

  attr_accessible :user_id

  has_many :story
  belongs_to :project

  def get_assigned_stories

  end

  def assign_story

  end

end