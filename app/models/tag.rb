class Tag < ApplicationRecord
  belongs_to :taggable, polymorphic: true
  belongs_to :category
end
