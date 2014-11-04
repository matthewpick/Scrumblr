class CreateStoriesUsers < ActiveRecord::Migration
  def up
  	create_table 'stories_users', :id => false do |t|
  		t.references 'stories'
  		t.references 'users'
  	end
  end

  def down
  	drop_table 'stories_users'
  end
end
