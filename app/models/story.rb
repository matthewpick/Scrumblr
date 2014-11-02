class Story < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  belongs_to :user
  belongs_to :project
  belongs_to :sprint
end
