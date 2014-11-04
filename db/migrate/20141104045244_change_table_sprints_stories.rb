class ChangeTableSprintsStories < ActiveRecord::Migration
  def up
  	change_table 'sprints_stories' do |t|
  		t.rename 'sprints_id', 'sprint_id'
  		t.rename 'stories_id', 'story_id'
  	end
  end

  def down
  	change_table 'sprints_stories' do |t|
  		t.rename 'sprint_id', 'sprints_id'
  		t.rename 'story_id', 'stories_id'
  	end
  end
end
