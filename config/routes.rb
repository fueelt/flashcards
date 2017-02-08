Rails.application.routes.draw do
#<<<<<<< HEAD
#  match '/cards', to: 'cards#show', via: 'get'	
#=======
#>>>>>>> b5149e372c8f2fac6ef23c509da3e6e3b11f1820
  get '/' => 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
