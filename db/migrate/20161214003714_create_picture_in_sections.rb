class CreatePictureInSections < ActiveRecord::Migration[5.0]
  def change
    create_table :picture_in_sections do |t|
      t.integer     :picture_id
      t.text        :sections, array: true, default: '{}'
      t.timestamps
    end
    
    add_index  :picture_in_sections, :sections, using: 'gin'
  end
end
