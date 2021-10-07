Rails.application.routes.draw do
  root 'welcome#index'
  resources :stores
  resources :employees
  resources :attendances
end
