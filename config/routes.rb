Rails.application.routes.draw do
  devise_for :employees
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  resources :gyms, only: %i[show new create]
  resources :trainers, only: %i[create new show edit update] 
  resources :activities, only: %i[show new create]
  resources :plans, only: %i[new create show]
  resources :prices, only: %i[new create]
  resources :employees, only: %i[new create show index edit update] do
    get 'change_status', on: :member
  end
  resources :clients, only: %i[show new create edit update]

  get 'trainers', to: 'trainers#management'
  get 'unactives', to: 'employees#unactives', as: 'employees_unactives'

  namespace :api do
    namespace :v1 do
      resources :gyms, only: %i[show]
    end
  end
  
end
