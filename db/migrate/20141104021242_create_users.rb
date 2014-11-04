class CreateUsers < ActiveRecord::Migration
  def up
  	create_table 'users' do |t|
  		t.string 'user_first_name'
  		t.string 'user_last_name'
  		t.string 'user_email'
  		t.integer 'user_velocity'
  		t.timestamps
  	end
  end

  def down
  	drop_table 'users'
  end
end
