Rails.application.routes.draw do
  resources :employees
  root 'welcome#index'
end
