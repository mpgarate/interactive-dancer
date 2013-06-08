class AddThumbToContentPieces < ActiveRecord::Migration
  def change
    add_column :content_pieces, :thumb_url, :string
  end
end
