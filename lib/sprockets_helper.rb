module SprocketsHelper
  def sprockets_include_tag
    content_tag(:script, "", :src => formatted_sprockets_path(:format => :js), :type => "text/javascript")
  end
end
