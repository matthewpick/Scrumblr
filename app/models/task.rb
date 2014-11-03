class Task < ActiveRecord::Base
  belongs_to :story
  
  attr_accessible :info, :needs_discussion, :points, :title

  
end
