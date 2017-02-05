class CreateSeoForPages < ActiveRecord::Migration[5.0]
  def change
    create_table :seo_for_pages do |t|
      t.string :page_identifier
      t.string :title
      t.text :description
      t.string :keywords
      t.string :image_url
      t.string :url

      t.timestamps
    end
  end
end
