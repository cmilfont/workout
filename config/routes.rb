Workout::Application.routes.draw do
  
  resources :rotinas
  
  root :to => 'home#index'

end
