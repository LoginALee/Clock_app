Rails.application.routes.draw do
  devise_for :users
  resources :alarms
  resources :stopwatches, except: %i[edit update show new]
  resources :timezones, except: %i[edit update show]
  get 'users/:id/edit_time_zone', to: 'users#edit_time_zone', as: :edit_time_zone
  put 'users/:id/edit_time_zone', to: 'users#update_time_zone', as: :update_time_zone
  patch 'users/:id/edit_time_zone', to: 'users#update_time_zone'
  get 'profile', to: 'users#edit'
  resources :users, only: %i[update]
  root 'main#home'
end
