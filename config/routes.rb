# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  mount ActionCable.server => "/cable"
  resources :posts
  resources :rooms
  resources :turbo_rooms
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
