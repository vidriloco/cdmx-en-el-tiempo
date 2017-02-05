class Article < ApplicationRecord
  has_many :tags, as: :taggable
  has_many :categories, through: :tags
  belongs_to :user
  
  def parameterized_category_list
    categories.map(&:title).map(&:parameterize).join(' ')
  end
end
