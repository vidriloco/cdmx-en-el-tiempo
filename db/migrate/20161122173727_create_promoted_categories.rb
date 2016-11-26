class CreatePromotedCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :promoted_categories do |t|
      t.integer :category_id
      t.integer :order
      t.boolean :visible
      
      t.timestamps
    end
  end
end
