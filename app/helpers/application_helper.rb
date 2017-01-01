module ApplicationHelper
  
  def current_route 
    request.env['PATH_INFO']
  end
end
