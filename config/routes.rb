Rails.application.routes.draw do
  root 'blogs#index'
  devise_for :users
  resources :users
  resources :blogs do
  	resource :likes, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
