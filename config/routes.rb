ActionController::Routing::Routes.draw do |map|

  map.resource :account, :controller => "users"
  map.resources :password_resets
  map.resources :users
  map.resource :user_session
  map.root :controller => "user_sessions", :action => "index"

  map.signup '/signup', :controller => 'users', :action => 'new'
  map.login '/login', :controller => 'user_sessions', :action => 'new'
  map.logout '/logout', :controller => 'user_sessions', :action => 'destroy'


  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end

