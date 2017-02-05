class SeoForPage < ApplicationRecord
  def self.find_for_page(route)
    self.where(page_identifier: route).first
  end
end
