class CreateProjects < ActiveRecord::Migration
  def up
  	create_table 'projects' do |t|
  		t.string 'project_name'
  		t.text 'project_description'
  		t.string 'project_github'
  		t.timestamps
  	end
  end

  def down
  	drop_table 'projects'
  end
end
