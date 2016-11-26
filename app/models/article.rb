class Article < ApplicationRecord
  has_many :tags, as: :taggable
  has_many :categories, through: :tags
  belongs_to :user
end
