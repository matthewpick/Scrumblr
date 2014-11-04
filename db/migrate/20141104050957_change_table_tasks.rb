class ChangeTableTasks < ActiveRecord::Migration
  def up
  	change_table 'tasks' do |t|
  		t.references 'story'
  	end
  end

  def down
  	change_table 'tasks' do |t|
  		t.remove 'story_id'
  	end
  end
end
