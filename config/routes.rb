Workout::Application.routes.draw do
  
  resources :rotinas
  resources :exercicios
  
  root :to => 'home#index'

end
