module ApplicationHelper
  
  def generic_title_helper
    "La Ciudad de México en el tiempo"
  end
  
  def current_route 
    request.env['PATH_INFO']
  end
  
  def seo_for_title(object)
    object.title unless object.nil?
  end
  
  def year_tag_for(year)
    return nil if year.blank?
    year
  end
  
  def seo_for_url(object)
    if object.is_a? SeoForPage
      object.url
    else
      "#{request.env['HTTP_HOST']}#{request.env['PATH_INFO']}"
    end
  end
  
  def seo_for_description(object)
    if object.is_a?(SeoForPage) || object.is_a?(Picture)
      object.description
    else
      object.content
    end
  end
  
  def seo_for_keywords(object)
    if object.is_a? SeoForPage
      object.keywords
    else
      object.parameterized_category_list.split(" ").join(", ")
    end
  end
  
  def seo_for_image_url(object)
    object.image_url unless object.nil?
  end
end
