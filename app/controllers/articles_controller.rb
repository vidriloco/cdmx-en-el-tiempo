class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
  end
  
  def index
    @articles = Article.all.order('created_at DESC')
    @seo = SeoForPage.find_for_page('articles-index-page')
  end
end
