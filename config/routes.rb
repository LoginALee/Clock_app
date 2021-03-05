Rails.application.routes.draw do
  devise_for :users
  resources :alarms
  resources :stopwatches, except: %i[edit update show new]
  resources :timezones, except: %i[edit update show]
  get 'profile', to: 'users#edit'
  resources :users, only: %i[update]
  get 'users/:id/edit_time_zone', to: 'users#edit_time_zone', as: :edit_time_zone
  put 'users/:id/edit_time_zone', to: 'users#update_time_zone', as: :update_time_zone
  patch 'users/:id/edit_time_zone', to: 'users#update_time_zone'
  resources :timers, except: %i[edit update show new]
  match '/404', via: :all, to: 'errors#not_found'
  match '/422', via: :all, to: 'errors#unprocessable_entity'
  match '/500', via: :all, to: 'errors#server_error'
  root 'main#home'
end
