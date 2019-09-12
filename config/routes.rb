Rails.application.routes.draw do
  root to: "home#index"

  resources :trainers, only: %i[create new show edit update] do
    get 'add_units', on: :member
  end

  devise_for :employees

  resources :gyms, only: %i[show new create]
  resources :trainers, only: %i[create new show edit update] 
  resources :activities, only: %i[show new create]
  resources :plans, only: %i[new create show]
  resources :prices, only: %i[new create]
  resources :employees, only: %i[new create show index edit update] do
    get 'change_status', on: :member
  end
  resources :clients, only: %i[show new create edit update index] do
    get 'ban', on: :member
    get 'suspend', on: :member
  end

  resources :gym_trainers, only: %i[destroy]
  
  resources :employees, only: %i[new create show]
  resources :gyms, only: %i[] do
    resources :trainers, only: %i[] do 
      resources :gym_trainers, only: %i[create]
      # delete 'banana', to: 'gym_trainers#destroy'
    end
  end
  get 'trainers', to: 'trainers#management'
  get 'unactives', to: 'employees#unactives', as: 'employees_unactives'

  namespace :api do
    namespace :v1 do
      resources :gyms, only: %i[index show]
    end
  end
  
end
