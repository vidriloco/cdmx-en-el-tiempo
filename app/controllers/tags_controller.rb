class TagsController < ApplicationController
  def show
    @category = Category.where(slug: params[:slug]).joins(:pictures).first
    @pictures = @category.pictures
  end
end
