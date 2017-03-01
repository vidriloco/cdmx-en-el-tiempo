class ChangePublishedColumnInPictures < ActiveRecord::Migration[5.0]
  def change
    remove_column :pictures, :published
    add_column :pictures, :published, :boolean, default: true
  end
end
