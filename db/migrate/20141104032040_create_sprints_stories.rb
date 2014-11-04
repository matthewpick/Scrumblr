class CreateSprintsStories < ActiveRecord::Migration
  def up
  	create_table 'sprints_stories', :id => false do |t|
  		t.references 'sprints'
  		t.references 'stories'
  	end
  end

  def down
  	drop_table 'sprints_stories'
  end
end
