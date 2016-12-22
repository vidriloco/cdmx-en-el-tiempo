class Category < ApplicationRecord
  has_many :tags, dependent: :destroy
  has_many :pictures, through: :tags, source: :taggable, source_type: "Picture"
  has_many :articles, through: :tags, source: :taggable, source_type: "Article"
  has_one :promoted_category
  
  before_validation :assign_slug
  
  validates :title, :slug, presence: true
  validates :slug, uniqueness: true
  
  protected
  
  def assign_slug
    self.slug = title.parameterize
  end
end
