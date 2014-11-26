class CreateInvitesProjects < ActiveRecord::Migration
  def up
    create_table 'invites_projects', :id => false do |t|
      t.references 'user'
      t.references 'project'
    end
  end

  def down
    drop_table 'invites_projects'
  end
end
