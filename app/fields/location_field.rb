require "administrate/field/base"

class LocationField < Administrate::Field::Base
  def to_s
    data
  end
  
  def latitude
    return data[0] unless data.nil?
  end
  
  def longitude
    return data[1] unless data.nil?
  end

end
