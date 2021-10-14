Rails.application.routes.draw do
  root 'welcome#index'

  resources :admin
  resources :stores, except: %i[:delete]
  resources :employees, except: %i[:delete]
  resources :attendances, except: %i[:delete]
end
