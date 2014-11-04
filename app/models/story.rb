class Story < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  belongs_to :user
  belongs_to :project
  belongs_to :sprint

  attr_accessible :name, :points, :description, :status

  def get_tasks

  end

  def add_task

  end
end
