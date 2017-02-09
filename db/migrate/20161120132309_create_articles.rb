class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string      :title
      t.text        :content
      t.integer     :user_id
      t.string      :reference_url
      t.text        :excerpt
      t.timestamps
    end
  end
end
