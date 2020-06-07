# frozen_string_literal: true

Rails.application.routes.draw do

  root 'admin/orders#index'

  namespace :admin do
    resources :users
    resources :addresses
    resources :orders do
      collection do
        get 'export'
      end
    end
    resources :products

    root to: 'orders#index'
  end

  devise_for :users, controllers: {
    registrations: 'registration/registrations',
    sessions: 'sessions'
  }

  resources :orders, only: [:create] do
    collection do
      post 'checkout'
    end
  end
end
