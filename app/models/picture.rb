class Picture < ApplicationRecord
  has_many :tags, as: :taggable
  has_many :categories, through: :tags
  has_one :picture_in_section
  belongs_to :user
  
  attr_accessor :location_lat
  attr_accessor :location_lng
  
  before_validation :assign_location
  before_validation :assign_list_of_tags
    
  validates :location_lat, :location_lng, :title, presence: true
  validates :image, attachment_presence: true
  
  has_attached_file :image, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  
  def self.all_pictures_with(categories)
    Picture.joins(:categories).select('title', 'year', 'image_file_name', 'image_content_type', 'image_file_size', 'image_updated_at', 'created_at', 'disposition_on_landing_page').select(:id).distinct.where('categories.id' => categories.map(&:category_id)).order('pictures.created_at ASC')
  end
  
  def self.find_in_another_time(picture, results)
    lat = picture.location[0]
    lng = picture.location[1]
    
    return [] if lat.nil? && lng.nil?
    
    all.limit(results).
    where("photo_taken_date <> :date AND ST_Distance_Sphere(location::geometry, 'POINT(:lat :lng)'::geometry) < :distance", { distance: 100, lat: lat, lng: lng, date: picture.photo_taken_date }).
    order("ST_Distance_Sphere(location::geometry, 'POINT(#{lat} #{lng})'::geometry) ASC")
  end
  
  def self.find_nearby(picture, distance_in_meters, results, opts="")
    lat = picture.location[0]
    lng = picture.location[1]
    
    return [] if lat.nil? && lng.nil?
    
    all.limit(results).where("ST_Distance_Sphere(location::geometry, 'POINT(:lat :lng)'::geometry) < :distance AND ST_Distance_Sphere(location::geometry, 'POINT(:lat :lng)'::geometry) > 100", { lat: lat, lng: lng, distance: distance_in_meters }).
    order("ST_Distance_Sphere(location::geometry, 'POINT(#{lat} #{lng})'::geometry) ASC")
  end
  
  def assign_location
    self.location = [@location_lat, @location_lng] if !(@location_lat.blank? && @location_lng.blank?)
  end
  
  def assign_list_of_tags
    self.list_of_tags = categories.map(&:title).join(', ')
  end
  
  def parameterized_category_list
    categories.map(&:title).map(&:parameterize).join(' ')
  end
  
  def has_owner?
    !user.nil?
  end
  
  def url
    image_url
  end
  
  def image_url
    unless image.blank?
      if image.url[0,2] == "//"
        "http:#{image.url}"
      else
        image.url
      end
    else
      ""
    end
  end
end
