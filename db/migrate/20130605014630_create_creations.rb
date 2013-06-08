class CreateCreations < ActiveRecord::Migration
  def change
    create_table :creations do |t|
      t.text :slides
      t.string :author
      t.datetime :created_time
      t.string :title
      t.integer :id
      t.integer :uploaded_content_group_id

      t.timestamps
    end
  end
end
