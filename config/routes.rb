Rails.application.routes.draw do
  resources :stores
  resources :employees
  resources :admin
  root 'welcome#index'
end
