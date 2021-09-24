Rails.application.routes.draw do
  
  devise_for :users
  
  resources :candidates, shallow: true do
    resources :reports
  end
  
  root to: "candidates#index"

end
