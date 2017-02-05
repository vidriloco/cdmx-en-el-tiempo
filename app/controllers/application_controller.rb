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
    @selected_pictures = ['https://scontent-ams3-1.xx.fbcdn.net/v/t1.0-9/15170888_1313063475382336_1281402008439870747_n.jpg?oh=63c6d2ca6d859da258c20bba95cc8caa&oe=58C86FA6', 'https://scontent-ams3-1.xx.fbcdn.net/v/t1.0-9/564223_474163192605706_1590431950_n.jpg?oh=441c819abd4455394c7e585945510c65&oe=58B1DE8C', 'http://www.eluniversal.com.mx/sites/default/files/styles/f03-651x400/public/2016/11/10/foto_principal.jpg?itok=tMC2l-4n&c=eb2d1d19d8db6223aff04d58cabd9c75']
  end
end
