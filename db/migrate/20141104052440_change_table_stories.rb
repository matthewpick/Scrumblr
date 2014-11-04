class ChangeTableStories < ActiveRecord::Migration
  def up
  	change_table 'stories' do |t|
  		t.references 'project'
  	end
  end

  def down
  	change_table 'stories' do |t|
  		t.remove 'project_id'
  	end
  end
end
