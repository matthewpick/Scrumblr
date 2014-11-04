class ChangeTableStoriesUsers < ActiveRecord::Migration
  def up
  	change_table 'stories_users' do |t|
  		t.rename 'stories_id', 'story_id'
  		t.rename 'users_id', 'user_id'
  	end
  end

  def down
  	change_table 'stories_users' do |t|
  		t.rename 'story_id', 'stories_id'
  		t.rename 'user_id', 'users_id'
  	end
  end
end
