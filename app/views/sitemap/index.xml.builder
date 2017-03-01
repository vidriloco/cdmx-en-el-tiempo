base_url = "http://#{request.host_with_port}/"

xml.instruct! :xml, :version=>"1.0"
xml.tag! 'urlset', 'xmlns' => 'http://www.sitemaps.org/schemas/sitemap/0.9', 'xmlns:image' => 'http://www.google.com/schemas/sitemap-image/1.1', 'xmlns:video' => 'http://www.google.com/schemas/sitemap-video/1.1' do
  xml.url do
    xml.loc base_url
    xml.lastmod "#{(DateTime.now-2.hours).to_s}"
    xml.changefreq "always"
    xml.priority "1"
  end
  
  @endpoints.each do |endpoint|
    xml.url do
      xml.loc "#{base_url}#{endpoint}"
      xml.lastmod "#{DateTime.now.yesterday.to_s}"
      xml.changefreq "always"
      xml.priority "0.5"
    end
  end
  
  @pictures.each do |picture|
    xml.url do
      xml.loc "#{base_url}fotografias/#{picture.id}/#{picture.title.parameterize}"
      xml.lastmod "#{DateTime.now.yesterday.to_s}"
      xml.changefreq "weekly"
      xml.priority "0.5"
    end
  end
  
  @articles.each do |article|
    xml.url do
      xml.loc "#{base_url}articulos-y-rutas/#{article.id}/#{article.title.parameterize}"
      xml.lastmod "#{DateTime.now.yesterday.to_s}"
      xml.changefreq "weekly"
      xml.priority "0.5"
    end
  end
  
  @tags.each do |tag|
    xml.url do
      xml.loc "#{base_url}tags/#{tag.category.title.parameterize}"
      xml.lastmod "#{DateTime.now.yesterday.to_s}"
      xml.changefreq "weekly"
      xml.priority "0.5"
    end
  end
  
end