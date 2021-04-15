Rails.application.routes.draw do
  root 'static_pages#home'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :contacts, only:%i[create]

  resources :gyms, only: %i[show index] do
    resources :comments, only: %i[create edit update destroy], module: :gyms
  end

  resources :trainers, only: %i[index show] do
    resources :comments, only: %i[create edit update destroy], module: :trainers
    resources :likes, only: %i[create destroy]
  end

  devise_for :users
  resources :users, only: [:show]
  # resources :users, only: [:show] do
  #   resources :comments, only: %i[create edit update destroy], module: :users
  # end

    resources :comments, only: %i[create edit update destroy]
  devise_scope :user do
  get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
