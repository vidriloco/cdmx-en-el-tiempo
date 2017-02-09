class CreatePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :pictures do |t|
      t.string        :title
      t.integer       :year
      t.date          :photo_taken_date
      t.text          :description
      t.integer       :user_id
      t.point         :location, geographic: true
      t.string        :credits
      t.string        :disposition_on_landing_page
      t.string        :published
      t.text          :list_of_tags
      t.timestamps
    end
  end
end
