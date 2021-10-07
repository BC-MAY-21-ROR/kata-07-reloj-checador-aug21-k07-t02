Rails.application.routes.draw do
  root 'welcome#index'
  
  resources :admin
  resources :stores
  resources :employees
end
