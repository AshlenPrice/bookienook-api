# frozen_string_literal: true
Rails.application.routes.draw do
  resources :reviews
  # resources :examples, except: [:new, :edit]
  get '/books', to: 'books#index'
  resources :books, only: [:index, :show]

  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  resources :users, only: [:index, :show]
end
