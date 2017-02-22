class AddStreetViewEmbedToPictures < ActiveRecord::Migration[5.0]
  def change
    add_column :pictures, :street_view_embed_url, :text
  end
end
