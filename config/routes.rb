Rails.application.routes.draw do
  resources :stores
  resources :employees
  root 'welcome#index'
end
