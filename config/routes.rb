Rails.application.routes.draw do
  devise_for :users
  resources :candidates
  resources :reports
  root to: "users#homepage"

end
