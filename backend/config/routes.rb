Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/login', to: 'auth#login'
  post '/signup', to: 'users#create'
  get '/profile', to: 'users#profile'
  get '/users/:id', to: 'users#show'
  get '/users', to: 'users#index'

  get '/folders/:id/notes', to: 'folders#notes'
  get '/folders', to: 'folders#index'
  post '/folders', to: 'folders#create'
  get '/folders/:id', to: 'folders#show'
  post '/folders/:id', to: 'folders#share'
  delete '/folders/:id', to: 'folders#delete'
  patch '/folders/:id', to: 'folders#edit'

  get '/notes', to: 'notes#index'
  post '/notes', to: 'notes#create'
  get '/notes/:id', to: 'notes#show'
  delete '/notes/:id', to: 'notes#delete'
  patch '/notes/:id', to: 'notes#edit'


  resources :users do
    resources :folders do
      resources :notes
    end
  end
end
