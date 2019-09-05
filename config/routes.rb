Rails.application.routes.draw do

  root to: "home#index"
  resources :trainers, only: %i[create new show edit update]
  devise_for :employees

  get '/trainers', to: 'trainers#management'

  resources :employees, only: %i[new create show]
  resources :plans, only: %i[new create show]
end
