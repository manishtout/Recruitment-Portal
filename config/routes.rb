Rails.application.routes.draw do
  
  devise_for :users
  
  resources :candidates, shallow: true do
    resources :reports
  end
  
  resources :employers

  get 'bulk_destroy', to: 'candidates#bulk_destroy'
  root to: "candidates#index"

end
