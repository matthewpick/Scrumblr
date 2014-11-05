class Story < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  has_and_belongs_to_many :users
  belongs_to :project
  has_and_belongs_to_many :sprints

  attr_accessible :name, :points, :description, :status

  def get_tasks
    tasks
  end

  def add_task (task)
    tasks << task;
  end
end
