Rails.application.routes.draw do

  root to: 'homes#top'
  devise_for :users
  get 'home/about' => 'homes#about'
  resources :books, only: [:index, :edit, :show, :update, :destroy, :create]
  resources :users, only: [:index, :edit, :show, :update]

  post 'favorite/:id' => 'favorites#create', as: 'create_like'

end
