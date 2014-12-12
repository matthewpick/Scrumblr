# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# after finding your uid from github, fill it in under users
users = [{:name => 'David', :provider => 'github', :uid => '8689486', :session_token => '1'},
				 {:name => 'Matt', :provider => 'github', :uid => '5581526', :session_token => '2'},
         {:name => 'Cody', :provider => 'github', :uid => '4641709', :session_token => '3'},
				 {:name => 'Becca', :provider => 'github', :uid => '4742605', :session_token => '4'},
         {:name => 'Michael', :provider => 'github', :uid => '8717464', :session_token => '5'},
         {:name => 'SELT', :provider => 'github', :uid => '3491883', :session_token => '6'},
				 {:name => 'Jon', :provider => 'github', :uid => '3200564', :session_token => '7'}]
         
projects = [{:project_name => 'Scrumblr', :project_description => 'Group 8 - SELT Final Project', :project_github => 'git@github.com/test'},
						{:project_name => 'Bumblr', :project_description => 'something', :project_github => 'git@github.com/test'}, 
						{:project_name => 'Crumblr', :project_description => 'something', :project_github => 'git@github.com/test'},
						{:project_name => 'Chumblr', :project_description => 'something', :project_github => 'git@github.com/test'}]
						
sprints = [{:sprint_start_date => Date.new(2014,11,17), :sprint_end_date => Date.new(2014,11,24)},
					 {:sprint_start_date => Date.new(2014,11,24), :sprint_end_date => Date.new(2014,11,30)}]

story_desc_1 = 'As a team member, So that I can view my progress, I want to view my assigned user stories'
story_desc_2 = 'Set bounds for a given Sprint, i.e. usually 2 week sprints'

stories = [{:project_id => 1, :story_name => 'View My Stories', :story_description => story_desc_1, :story_points => 1, :story_status => 'started'},
           {:project_id => 1, :story_name => 'Assign Sprint Dates', :story_description => story_desc_2, :story_points => 1, :story_status => 'started'}]
           
tasks = [{:title => 'Write Code', :points => 1, :status => 'completed', :description => 'Solve the problem', :needs_discussion => false},
         {:title => 'Deploy', :points => 1, :status => 'in_progress', :description => 'Deploy to Heroku', :needs_discussion => true},
	 			 {:title => 'No Overlap', :points => 1, :status => 'in_review', :description => "Make Sure sprints don't overlap", :needs_discussion => true},
	       {:title => 'Test', :points => 1, :status => 'backlog', :description => 'Write RSpec tests', :needs_discussion => true},
				 {:title => 'Ordering', :points => 2, :status => 'in_review', :description => 'Order sprints by start date', :needs_discussion => false},
         {:title => 'Date-Picker', :points => 1, :status => 'in_progress', :description => 'Functional date picker on all browsers', :needs_discussion => true}]

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

# Assign dummmy projects/stories to every user
User.all.each do |user|
	user.projects << Project.find(1)
	user.projects << Project.find(2)
	user.stories << Story.find(1)
	user.stories << Story.find(2)
end


@project = Project.find(1)
@project.sprints << Sprint.find(1)
@project.sprints << Sprint.find(2)
@project.stories << Story.find(1)

@sprint = Sprint.find(1)
@sprint.stories << Story.find(1)
@sprint.stories << Story.find(2)

@story = Story.find(1)
@story.tasks << Task.find(1)
@story.tasks << Task.find(2)

@story = Story.find(2)
@story.tasks << Task.find(3)
@story.tasks << Task.find(4)
@story.tasks << Task.find(5)
@story.tasks << Task.find(6)

# Invite all users to dummy projects
User.all.each do |user|
	user.invites << Project.find(3)
	user.invites << Project.find(4)
end


