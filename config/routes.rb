Rails.application.routes.draw do

  root to: "home#index"

  resources :trainers, only: %i[create new show edit update] do
    get 'add_units', on: :member
    resources :gym_trainers, only: %i[create]
    
  end

  devise_for :employees

  get '/trainers', to: 'trainers#management'


  resources :employees, only: %i[new create show]
end
