Rails.application.routes.draw do
  devise_for :users
  root "main#home"
  resources :alarms
  resources :stopwatches
  resources :timezones
end
