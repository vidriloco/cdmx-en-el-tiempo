class AddListOfTagsFieldToPictures < ActiveRecord::Migration[5.0]
  def self.up
    add_column :pictures, :list_of_tags, :text
  end
  
  def self.down
    remove_column :pictures, :list_of_tags
  end
end
