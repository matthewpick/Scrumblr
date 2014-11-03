class Project < ActiveRecord::Base
  attr_accessible :project_id, :project_name, :project_description, :project_github

   has_many :story, :user, :sprint

   def get_stories
   
   end
   
   def add_story(story)

   end

   def get_users
   
   end

   def add_user(user_id)

   end

   def get_sprints

   end

   def add_sprint(sprint)

   end

end
