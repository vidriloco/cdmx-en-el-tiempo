class PicturesController < ApplicationController
  
  def show
    @spot_picture = Picture.find(params[:id])
    @more_pictures_in_another_time = Picture.find_in_another_time(@spot_picture, 4)
    @spot_pictures_nearby = Picture.find_nearby(@spot_picture, 3000, 4)
  end
  
  def index
    @pictures = Picture.published.order('created_at DESC')
    @seo = SeoForPage.find_for_page('pictures-index-page')
  end
  
end
