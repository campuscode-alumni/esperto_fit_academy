Rails.application.routes.draw do
  devise_for :employees
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  resources :gyms, only: %i[show new create]
  resources :trainers, only: %i[create new show edit update] 
  resources :employees, only: %i[new create show index edit update]

  get 'trainers', to: 'trainers#management'
  get 'employee/service', to: 'employees#service_area'

  resources :employees, only: %i[new create show]
  resources :plans, only: %i[new create show]
end
