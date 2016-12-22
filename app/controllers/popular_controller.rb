class PopularController < ApplicationController
  def index
    @pictures = Picture.where("list_of_tags LIKE ?", "%Week top 10%")
  end
end
