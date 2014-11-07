# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = [{:user_first_name => 'john', :user_last_name => 'doe', :user_email => 'something@domain.com', :user_velocity => '5'}]
projects = [{:project_name => 'Scrumblr', :project_description => 'hey look! our SELT project!', :project_github => 'git@github.com/test'},
						{:project_name => 'Bumblr', :project_description => 'something', :project_github => 'git@github.com/test'}]
sprints = [{:sprint_start_date => nil, :sprint_end_date => nil}]
stories = [{:story_name => 'test', :story_description => 'this is a test', :story_points => 1, :story_status => 'started'}]

users.each do |user|
	User.create!(user)
end

projects.each do |project|
	Project.create!(project)
end

sprints.each do |sprint|
	Sprint.create!(sprint)
end

stories.each do |story|
	Story.create!(story)
end
