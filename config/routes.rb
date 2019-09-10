Rails.application.routes.draw do
  root to: "home#index"

  resources :trainers, only: %i[create new show edit update] do
    get 'add_units', on: :member
  end

  devise_for :employees

  get '/trainers', to: 'trainers#management'

  resources :gym_trainers, only: %i[destroy]
  
  resources :employees, only: %i[new create show]
  resources :gyms, only: %i[] do
    resources :trainers, only: %i[] do 
      resources :gym_trainers, only: %i[create]
      # delete 'banana', to: 'gym_trainers#destroy'
    end
  end
end
