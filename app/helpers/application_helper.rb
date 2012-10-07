module ApplicationHelper

  THUMBNAILS_LIMIT = 9

  def google_font_link_tag(family)
    tag(
      'link', {
        :rel => :stylesheet,
        :type => Mime::CSS,
        :href => "https://fonts.googleapis.com/css?family=#{family.sub(' ', '+')}"
      },
      false, 
      false
    )
  end

  
end
