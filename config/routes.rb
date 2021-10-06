Rails.application.routes.draw do
  root 'welcome#index'
  
  resources :admin do
    resources :stores
    resources :employees
  end
end
