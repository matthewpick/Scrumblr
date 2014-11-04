class ChangeTableSprints < ActiveRecord::Migration
  def up
  	change_table 'sprints' do |t|
  		t.references 'project'
  	end
  end

  def down
  	change_table 'sprints' do |t|
  		t.remove 'project_id'
  	end
  end
end
