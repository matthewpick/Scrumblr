class Sprint < ActiveRecord::Base
	attr_accessible :sprint_start_date, :sprint_end_date
	
	has_and_belongs_to_many :stories
	belongs_to :project
	
	#info hash will contain :sprint_start_date and :sprint_end_date
	#project_id will be a parameter from the route
	def self.create_sprint(info_hash, project_id)	
		new_sprint = Sprint.new(info_hash)
		Project.find(project_id).sprints << new_sprint
	end
	
	#start_date will be DateTime received from a form submission
	#sprint_id will be a parameter from the route
	def self.assign_start_date(start_date, sprint_id)
		sprint = Sprint.find(sprint_id)
		sprint.sprint_start_date = start_date
		sprint.save
	end
	
	#end_date will be DateTime received from a form submission
	#sprint_id will be a parameter from the route
	def self.assign_end_date(end_date, sprint_id)
		sprint = Sprint.find(sprint_id)
		sprint.sprint_end_date = end_date
		sprint.save
	end
	
	#sprint_id will be a parameter from the route
	def calculate_velocity(sprint_id)
		stories = Sprint.find(sprint_id).stories
		velocity = 0
		
		stories.each do |s|
			velocity = velocity + s.story_points
		end
		
	end
	
	#story_id could come from multiple places? 
	#sprint_id could come from multiple places?
	def assign_story(story_id, sprint_id)
		sprint = Sprint.find(sprint_id)
		sprint.stories << Story.find(story_id)
	end
	
	#sprint_id will be a parameter form the route
	def get_stories(sprint_id)
		Sprint.find(sprint_id).stories
	end
	
end

