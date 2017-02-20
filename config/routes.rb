# frozen_string_literal: true
Rails.application.routes.draw do
  # get '/books', to: 'books#index'
  resources :examples, except: [:new, :edit]
  resources :books, only: [:index, :show]
  resources :reviews, except: [:new, :edit]
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  resources :users, only: [:index, :show]
end
