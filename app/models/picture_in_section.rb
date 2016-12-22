class PictureInSection < ApplicationRecord
  belongs_to :picture
  
  before_save :adapt_sections
end
