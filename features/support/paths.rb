module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in webrat_steps.rb
  #

  def host_server(path)
    'http://localhost:3001' + path
  end

  def path_to(page_name)
    case page_name

    when /the homepage/
     host_server '/'
    when /Perfil/
     host_server '/account'
    when /Log in/
     host_server '/user_session/new'
    when /REGISTRAR/
     host_server '/account/new'

    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(NavigationHelpers)

