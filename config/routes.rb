Rails.application.routes.draw do

  root to: "home#index"
  resources :trainers, only: %i[create new show edit update]
  devise_for :employees

  get '/trainers', to: 'trainers#management'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
