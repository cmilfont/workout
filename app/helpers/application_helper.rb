# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def gravatar_photo
    require 'md5'
    hash = MD5::md5(current_user.email)
    image_src = "<img id=\"avatar\" alt=\"#{current_user.login}\" src=\"http://www.gravatar.com/avatar/#{hash}?d=monsterid\" />"
  end

end

