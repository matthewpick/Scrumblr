class CreateTasks < ActiveRecord::Migration
  def up
  	create_table 'tasks' do |t|
  		t.string 'task_name'
  		t.text 'task_description'
  		t.string 'task_status'
  	end
  end

  def down
  	drop_table 'tasks'
  end
end
