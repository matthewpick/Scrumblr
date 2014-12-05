class Story < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  has_and_belongs_to_many :users
  belongs_to :project
  has_and_belongs_to_many :sprints

  attr_accessible :story_name, :story_points, :story_description, :story_status

  def add_task (task)
    tasks << task;
  end
  
  def count_discussions
    discussions = 0
    
    tasks.each do |task|
      if task.needs_discussion
        discussions += 1
      end
    end
    
    return discussions
  end
  
  def calculate_points
    points = 0;
    tasks.each do |task|
      points += task.points
    end
    
    return points
  end
  
  def completed?
    tasks.each do |task|
      if !task.completed?
        return false
      end
    end
    
    return true
  end
  
  def count_completed_tasks
    completed = 0
    
    tasks.each do |task|
      if task.completed?
        completed += 1
      end
    end
    
    return completed
  end

  validates :story_name, :presence => true
end
