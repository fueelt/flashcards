Rails.application.routes.draw do
  match '/cards', to: 'cards#show', via: 'get'	
  get '/' => 'home#index'
end