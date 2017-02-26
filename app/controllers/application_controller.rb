class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
    
  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || '/admin'
  end
    
  def index
    @seo = SeoForPage.find_for_page('main-page')
    @article = Article.first
    @categories = PromotedCategory.on_landing_page
    @pictures = Picture.all_pictures_with(@categories)
    @recent_pictures = Picture.last(6)
    @selected_pictures = ['https://s3-us-west-2.amazonaws.com/cdmxeneltiempo-prod/pages/principal.jpg', 'https://s3-us-west-2.amazonaws.com/cdmxeneltiempo-prod/pages/3.jpg']
  end
end
