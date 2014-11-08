class Sprint < ActiveRecord::Base
	attr_accessible :sprint_start_date, :sprint_end_date
	
	has_and_belongs_to_many :stories
	belongs_to :project
	
	def self.create_sprint(info_hash)	
		new_sprint = Sprint.create!(info_hash)
	end
	
	def add_story(story)
		stories << story
	end
	
	def calculate_velocity
		velocity = 0		
		stories.each do |s|
			velocity = velocity + s.story_points
		end
		
		return velocity
	end	
end

