require "administrate/field/base"

class EnrichedTextField < Administrate::Field::Base
  def to_s
    data
  end
end
