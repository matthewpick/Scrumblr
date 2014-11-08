class CreateTasks < ActiveRecord::Migration
  def up
  	create_table 'tasks' do |t|
  		t.string  'title'
		t.integer 'points'
		t.boolean 'needs_discussion'
		t.text    'description'
		t.string  'status'
		t.timestamps
  	end
  end

  def down
  	drop_table 'tasks'
  end
end
