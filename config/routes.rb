Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tweets#index'

  resources :tweets do
    resources :hashtags, only: [:create, :destroy]
  end
  resources :users
  resources :followings, only: [:create, :destroy]

end
