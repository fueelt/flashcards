Rails.application.routes.draw do
 
 resources :cards
 # get '/' => 'home#index'
 # get '/cards' => 'cards#index'
 # get '/cards' => 'cards#edit'
 root 'home#index'
end