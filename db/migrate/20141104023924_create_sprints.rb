class CreateSprints < ActiveRecord::Migration
  def up
  	create_table 'sprints' do |t|
  		t.date 'sprint_start_date'
  		t.date 'sprint_end_date'
  	end
  end

  def down
  	drop_table 'sprints'
  end
end
