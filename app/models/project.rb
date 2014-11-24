class Project < ActiveRecord::Base
  attr_accessible :project_id, :project_name, :project_description, :project_github

   has_many :stories
   has_many :sprints
   has_and_belongs_to_many :users

   def self.create_project(info_hash)
      new_project = Project.new(info_hash)
   end

   def get_users
   
   end

   def add_user(user_id)

   end

   def get_sprints

   end

   def add_sprint(sprint)

   end
   
   def count_discussions
     discussions = 0
     
     sprints.each do |sprint|
       discussions += sprint.count_discussions
     end
     
     return discussions
   end
   
   def average_velocity
    average = 0
    
    sprints.each do |sprint|
      average += sprint.calculate_velocity
    end
    
    if sprints.count > 0
      average = average.to_f / sprints.count
    end
    
    return average
   end

end
