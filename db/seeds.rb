# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Project.create!([{:project_name => 'test', :project_description => 'this is a test', :project_github => 'git@github.com/test'}])
Sprint.create!([{:sprint_start_date => nil, :sprint_end_date => nil}])
