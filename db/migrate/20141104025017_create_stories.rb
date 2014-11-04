class CreateStories < ActiveRecord::Migration
  def up
  	create_table 'stories' do |t|
  		t.string 'story_name'
  		t.text 'story_description'
  		t.integer 'story_points'
  		t.string 'story_status'
  	end
  end

  def down
  	drop_table 'stories'
  end
end
