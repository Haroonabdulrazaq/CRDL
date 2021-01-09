# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :users, only: [:show]
  resources :prices
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'samples#index'
  resources :samples do
    resources :results
  end
end
