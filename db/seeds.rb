# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# after finding your uid from github, fill it in under users
users = [{:name => 'David', :provider => 'github', :uid => '', :session_token => ''}]
projects = [{:project_name => 'Scrumblr', :project_description => 'hey look! our SELT project!', :project_github => 'git@github.com/test'},
						{:project_name => 'Bumblr', :project_description => 'something', :project_github => 'git@github.com/test'}]
sprints = [{:sprint_start_date => Date.new(2014,11,17), :sprint_end_date => Date.new(2014,11,24)},{:sprint_start_date => Date.new(2014,11,24), :sprint_end_date => Date.new(2014,11,30)}]
stories = [{:story_name => 'test', :story_description => 'this is a test', :story_points => 1, :story_status => 'started'}, {:story_name => 'test2', :story_description => 'this is a test2', :story_points => 1, :story_status => 'started'}]
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

@user = User.find_by_uid()  # put your uid here
@user.projects << Project.find(1)
@user.projects << Project.find(2)

@project = Project.find(1)
@project.sprints << Sprint.find(1)
@project.sprints << Sprint.find(2)

@sprint = Sprint.find(1)
@sprint.stories << Story.find(1)
@sprint.stories << Story.find(2)

@story = Story.find(1)
@story.tasks << Task.find(1)
@story.tasks << Task.find(2)
