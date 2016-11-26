class Picture < ApplicationRecord
  has_many :tags, as: :taggable
  has_many :categories, through: :tags
  belongs_to :user
  
  attr_accessor :location_lat
  attr_accessor :location_lng
  
  before_save :save_location
  
  validates :location_lat, :location_lng, :title, :year, :url, presence: true
  
  def self.all_pictures_with(categories)
    Picture.joins(:categories).select('title', 'year', 'url', 'created_at', 'disposition_on_landing_page').select(:id).distinct.where('categories.id' => categories.map(&:category_id)).order('pictures.created_at ASC')
  end
  
  def save_location
    self.location = [@location_lat, @location_lng]
  end
  
  def list_of_tags
    categories.map(&:title).join(', ')
  end
  
  def parameterized_category_list
    categories.map(&:title).map(&:parameterize).join(' ')
  end
end
