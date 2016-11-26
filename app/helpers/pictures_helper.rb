module PicturesHelper
  def tags_for(picture)
    category_list = ""
    picture.categories.each do |category|
      category_list << link_to(category.title, tag_path(category.title.parameterize)).concat(", ")
    end
    category_list.chop.chop.html_safe
  end
end
