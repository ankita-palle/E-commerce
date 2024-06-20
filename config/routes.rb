# frozen_string_literal: true

Rails.application.routes.draw do
  root 'products#index'
  devise_for :users
  resources :products
  resources :carts, only: [:index]
  resources :cart_items, only: %i[show create destroy index]
  resources :orders, only: %i[index new show destroy]
  get '/create/:id', to: 'orders#create', as: :order_create
end
