Rails.application.routes.draw do

  root to: "home#index"
  resources :trainers, only: %i[create new show]
  devise_for :employees
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
