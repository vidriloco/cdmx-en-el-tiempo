class Article < ApplicationRecord
  has_many :tags, as: :taggable
  has_many :categories, through: :tags
  belongs_to :user
  
  has_attached_file :image, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  
  def image_url
    image.url
  end
  
  def parameterized_category_list
    categories.map(&:title).map(&:parameterize).join(' ')
  end
end
