Rails.application.routes.draw do

  get 'signup', to: 'operators#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :operators
  resources :sessions, :only => [:new, :create, :destroy]
  resources :tickets, :except => [:update, :destroy]
  resources :tickets_types, :only => [:new, :create]
  resources :statuses
  resources :departments
   
  root to: "tickets#new"
end
