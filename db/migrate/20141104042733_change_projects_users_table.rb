class ChangeProjectsUsersTable < ActiveRecord::Migration
  def up
  	change_table 'projects_users' do |t|
  		t.rename 'projects_id', 'project_id'
  		t.rename 'users_id', 'user_id'
  	end
  end

  def down
  	change_table 'projects_users' do |t|
  		t.rename 'project_id', 'projects_id'
  		t.rename 'user_id', 'users_id'
  	end
  end
end
