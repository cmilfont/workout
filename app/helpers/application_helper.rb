# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def gravatar_photo
    require 'md5'
    hash = MD5::md5(current_user.email)
    image_src = "<img src=\"http://www.gravatar.com/avatar/#{hash}?d=monsterid\" />"
  end

end

