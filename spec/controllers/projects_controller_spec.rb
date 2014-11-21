require 'spec_helper'
require 'rails_helper'

describe ProjectsController do
  describe 'showing a particular project' do
    it 'should return all the sprint info as json' do
      @fake_sprint = Sprint.create! Hash[:sprint_start_date => Date.new(2014,11,7), :sprint_end_date => Date.new(2014,11,21)]
      @fake_project = Project.create!(Hash[:project_name => 'Dummy Name', :project_description => 'Description', :project_github => 'git@github/dummy'])
      @fake_project.sprints << @fake_sprint
      get :show, {:id => 1}
      expect(assigns(:sprints)).to eq(Project.find('1').sprints)
      expect(assigns(:info_array)).to eq([{"id" => @fake_sprint.id, "project_id" => @fake_sprint.project_id, "sprint_start_date" => @fake_sprint.sprint_start_date, 
                                           "sprint_end_date" => @fake_sprint.sprint_end_date, "discussions" => @fake_sprint.count_discussions}])
    end
  end
end
