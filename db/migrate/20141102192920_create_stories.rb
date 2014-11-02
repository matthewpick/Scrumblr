class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.belongs_to :user
      t.belongs_to :sprint
      t.belongs_to :project
      t.timestamps

      t.string :name
      t.decimal :points
      t.string :description
      t.string :status
    end
  end
end
