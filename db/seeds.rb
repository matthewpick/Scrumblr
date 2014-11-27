# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# after finding your uid from github, fill it in under users
users = [{:name => 'David', :provider => 'github', :uid => '8689486', :session_token => '1'}, {:name => 'Matt', :provider => 'github', :uid => '5581526', :session_token => '2'},
         {:name => 'Cody', :provider => 'github', :uid => '4641709', :session_token => '3'}, {:name => 'Becca', :provider => 'github', :uid => '4742605', :session_token => '4'},
         {:name => 'Michael', :provider => 'github', :uid => '8717464', :session_token => '5'}]
         
projects = [{:project_name => 'Scrumblr', :project_description => 'hey look! our SELT project!', :project_github => 'git@github.com/test'},
						{:project_name => 'Bumblr', :project_description => 'something', :project_github => 'git@github.com/test'}, 
						{:project_name => 'Crumblr', :project_description => 'something', :project_github => 'git@github.com/test'},
						{:project_name => 'Chumblr', :project_description => 'something', :project_github => 'git@github.com/test'}]
						
sprints = [{:sprint_start_date => Date.new(2014,11,17), :sprint_end_date => Date.new(2014,11,24)},{:sprint_start_date => Date.new(2014,11,24), :sprint_end_date => Date.new(2014,11,30)}]

stories = [{:story_name => 'test', :story_description => 'this is a test', :story_points => 1, :story_status => 'started'}, 
           {:story_name => 'test2', :story_description => 'this is a test2', :story_points => 1, :story_status => 'started'}]
           
tasks = [{:title => 'task', :points => 1, :status => 'completed', :description => 'this is a test', :needs_discussion => false},
         {:title => 'task2', :points => 1, :status => 'completed', :description => 'this is a test', :needs_discussion => true}]

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

tasks.each do |task|
  Task.create!(task)
end

# Assign dummmy projects to every user
User.all.each do |user|
	user.projects << Project.find(1)
	user.projects << Project.find(2)
end


@project = Project.find(1)
@project.sprints << Sprint.find(1)
@project.sprints << Sprint.find(2)

@sprint = Sprint.find(1)
@sprint.stories << Story.find(1)
@sprint.stories << Story.find(2)

@story = Story.find(1)
@story.tasks << Task.find(1)
@story.tasks << Task.find(2)

# Invite all users to dummy projects
User.all.each do |user|
  user.invites << Project.find(3)
  user.invites << Project.find(4)
end

