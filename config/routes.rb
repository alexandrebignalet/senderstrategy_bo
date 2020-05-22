Rails.application.routes.draw do
  # Devise
  devise_for :users, :controllers => {:registrations => "registration/registrations"}


  root 'welcome#index'
end
