Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # devise_for :users
  root to: "toppage#index"

  resources :tweets do
    resource :like, only: [:show, :create, :destroy]
    resources :replies, only: [:index, :new, :show, :create, :destroy]
  end
  # root "tweets#index"

  resource :profile, only: [:show, :edit, :update]

end
