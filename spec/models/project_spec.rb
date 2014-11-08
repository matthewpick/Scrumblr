require 'spec_helper'
require 'rails_helper'

describe Project do
   describe 'creating a new project' do
      before :each do
         load Rails.root + 'db/seeds.rb'
         @fake_hash = Hash[:project_name => 'Dummy Name', :project_description => 'Description', :project_github => 'git@github/dummy']
         @fake_project = Project.new(@fake_hash)
      end
      it 'should create a new Project Object' do
         expect(Project).to receive(:new).with(@fake_hash).and_return(@fake_project)
         Project.create_project(@fake_hash)
      end
      it 'should commit the project to the database' do
         allow(Project).to receive(:new).with(@fake_hash).and_return(@fake_project)
         expect(@fake_project).to receive(:save).with(@fake_hash)
         Project.create_project(@fake_hash)
      end
   end

   describe 'assigning users to a project' do
   end

   describe 'getting the users of a project' do
   end

   describe 'adding sprints to a project' do
   end
   
   describe 'getting the sprints for a project' do
   end
end
