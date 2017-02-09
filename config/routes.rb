Rails.application.routes.draw do
  get '/' => 'home#index'
  get '/cards' => 'cards#show'
end