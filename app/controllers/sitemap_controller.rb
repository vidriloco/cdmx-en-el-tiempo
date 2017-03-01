class SitemapController < ApplicationController
  
  def index
    @endpoints = ['coleccion', 'fotografias', 'nuestra-coleccion', 'articulos-y-rutas']
    @pictures = Picture.published
    @articles = Article.published
    @tags = Tag.all
    
    respond_to do |format|
      format.xml
    end
  end
  
end
