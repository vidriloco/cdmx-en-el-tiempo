class AddExcerptToArticles < ActiveRecord::Migration[5.0]
  def self.up
    add_column :articles, :excerpt, :text
    add_column :articles, :image_url, :string
  end
  
  def self.down
    remove_column :articles, :excerpt
    remove_column :articles, :image_url
  end
end
