class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :info
      t.integer :points
      t.boolean :needs_discussion

      t.timestamps
    end
  end
end
