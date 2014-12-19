Rails.application.routes.draw do
  
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  
  resources :sessions
  resources :users
  resources :bookmarks

  get 'welcome/index'

  get 'welcome/about'

  root to: 'welcome#index'

  post :incoming, to: 'incoming#create'

end
