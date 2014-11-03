class Sprint < ActiveRecord::Base
	attr_accessible :sprint_start_date, :sprint_end_date
	has_many :story
	belongs_to :project
	
	def self.create_sprint(info_hash)
		
	end
	
	def assign_start_date(start_date)
	
	end
	
	def assign_end_date(end_date)
	
	end
	
	def calculate_velocity
	
	end
	
	def assign_story(new_story)
	
	end
	
	def get_stories
	
	end
	
end

