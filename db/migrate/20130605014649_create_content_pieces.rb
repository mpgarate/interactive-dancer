class CreateContentPieces < ActiveRecord::Migration
  def change
    create_table :content_pieces do |t|
      t.string :url
      t.string :format
      t.integer :id

      t.timestamps
    end
  end
end
