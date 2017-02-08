Rails.application.routes.draw do
  match '/cards', to: 'cards#show', via: 'get'	
  get '/' => 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
