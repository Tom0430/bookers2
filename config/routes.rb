Rails.application.routes.draw do
  get 'tops/top'
  get 'tops/about'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :index, :show, :edit, :update]
  resources :books, only: [:show, :edit, :index, :create, :destroy, :update]
  root 'tops#top'
  get 'home/about', to: 'tops#about'
end