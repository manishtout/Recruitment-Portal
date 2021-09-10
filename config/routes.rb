Rails.application.routes.draw do
  devise_for :users
  resources :candidates
  root to: "users#homepage"
end
