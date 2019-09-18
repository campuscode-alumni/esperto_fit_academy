Rails.application.routes.draw do
  root to: "home#index"

  resources :trainers, only: %i[create new show edit update] do
    get 'add_units', on: :member
  end

  devise_for :employees

  resources :gyms, only: %i[index show new create edit update destroy]
  resources :trainers, only: %i[create new show edit update] 
  resources :activities, only: %i[index show new create edit update]
  resources :plans, only: %i[new create show edit update destroy]
  resources :prices, only: %i[new create]
  resources :employees, only: %i[new create show index edit update] do
    get 'change_status', on: :member
  end
  resources :clients, only: %i[show new create edit update index] do
    get 'ban', on: :member
    get 'suspend', on: :member
    get 'inactivate', on: :member 
    get 'verify_payments', on: :member
  end

  resources :gym_trainers, only: %i[destroy]
  
  resources :employees, only: %i[new create show]
  resources :gyms, only: %i[] do
    resources :trainers, only: %i[] do 
      resources :gym_trainers, only: %i[create]
    end
  end
  get 'trainers', to: 'trainers#management'
  get 'plans', to: 'plans#management'
  get 'unactives', to: 'employees#unactives', as: 'employees_unactives'

  namespace :api do
    namespace :v1 do
      get 'show_all_plans', to: 'plans#show_all'
      resources :plans, only: %i[index show] do
      end
      resources :gyms, only: %i[index show destroy] do
        resources :plans, only: %i[index] 
        resources :activities, only: [:index]
      end
      resources :clients, only: %i[create] do
        get 'consult_cpf/:cpf', to: 'clients#consult_cpf', on: :collection
        post ':cpf', to: 'clients#show', on: :collection
      end
      post 'inactivate_client/:cpf', to: 'clients#inactivate'
    end
  end
  
end
