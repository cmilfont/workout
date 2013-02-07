Workout::Application.routes.draw do
  
  resources :rotinas
  resources :exercicios
  resources :itens
  
  root :to => 'home#index'

end
