Rails.application.routes.draw do
  
  get 'sessions/new'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  
  resources :sessions
  resources :users
  resources :bookmarks do
    resources :favorites, only: [:create, :destroy]
  end

  get 'welcome/index'

  get 'welcome/about'

  root to: 'welcome#index'

  post :incoming, to: 'incoming#create'

  get 'bookmark/topic/:topic', to: 'bookmarks#topic', as: 'topic'


end
