class AddPublishedToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :published, :boolean, default: true
  end
end
