class CreateSprints < ActiveRecord::Migration
  def up
  	create_table 'sprints' do |t|
  		t.datetime 'sprint_start_date'
  		t.datetime 'sprint_end_date'
  	end
  end

  def down
  	drop_table 'sprints'
  end
end
