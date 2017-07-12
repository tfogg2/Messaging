Rails.application.routes.draw do



  root to: 'welcome#about'
  get '/signup', to: 'registrations#new'
  post '/signup', to: 'registrations#create'

  get 'login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'users/:id', to: 'users#show', as: "profile"



  resources :chatrooms, param: :slug
  resources :messages

  # serve websocket cable requests in-processs
  mount ActionCable.server => '/cable'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
