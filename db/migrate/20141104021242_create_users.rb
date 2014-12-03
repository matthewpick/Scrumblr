class CreateUsers < ActiveRecord::Migration
  def up
  	create_table 'users' do |t|
  		t.string 'name'
  		t.string 'provider'
  		t.string 'uid'
  		t.string 'email'
			t.string 'github_username'
			t.string 'image_url'
			t.string 'github_url'
			t.string 'session_token'
  		t.integer 'user_velocity'
  		t.timestamps
  	end
  end

  def down
  	drop_table 'users'
  end
end
