class Task < ActiveRecord::Base
  belongs_to :story
  
  def self.all_status
    %w(backlog in_progress in_review completed)
  end
  
  attr_accessible :description, :needs_discussion, :points, :title, :status

  validates :title, :presence => true
  validates :points, :inclusion => {:in => 1..5}
  validates :status, :inclusion => {:in => Task.all_status}
  
  def completed?
    return status == 'completed'
  end
end
