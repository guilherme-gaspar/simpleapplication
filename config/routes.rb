Rails.application.routes.draw do

  #mapeando
  get '/bemvindo' => 'home#index'
  #rota root principal
  root 'home#index'

  resources :phones
  resources :addresses
  resources :contacts #, except: [:edit] OU only: [:edit]
  resources :kinds #cria as 8 rotas
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
