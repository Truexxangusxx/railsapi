Rails.application.routes.draw do
  resources :services
  resources :users
  resources :colaborators
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  
  get '/test', to: 'users#test'
  get '/user/get/:id', to: 'users#get'
  post '/login', to: 'users#login'
  post '/code', to: 'users#code'

end
