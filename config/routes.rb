Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users

  get '/home/about', to: 'homes#about', as: 'about'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :edit, :show, :update, :create,]
  resources :books
end
