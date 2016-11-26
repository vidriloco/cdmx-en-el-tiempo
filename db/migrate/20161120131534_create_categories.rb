class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string      :title
      t.string      :description
      t.string      :kind
      t.string      :slug
      t.timestamps
    end
  end
end
