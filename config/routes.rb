Rails.application.routes.draw do
  resources :users
  # function
  resources :sessions, only: [:new, :create, :destroy]
  # we can only make and delete post just like twitter 
  resources :microposts, only: [:create, :destroy]
  #for follow and unfolow
  resources :relationships, only: [:create, :destroy]
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'
  # get 'users/new'
  root 'static_pages#home'

  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
  # list
  resources :users do
    member do                    # no id needed for the members
      get :following, :followers #users/:id/following || users/:id/followers
    end
  end
  resources :microposts do
    # resources :likes
    member do
      get :uplike, :dislike #resources :likes  #microposts/:id/likes/:id
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
