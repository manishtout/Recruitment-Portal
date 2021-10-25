Rails.application.routes.draw do
  
  devise_for :users
  
  resources :employers do
    resources :candidates
    resources :memberships
  end

  resources :candidates, shallow: true do
    resources :reports
  end

  get 'bulk_destroy', to: 'candidates#bulk_destroy'
  root to: "employers#index"

end
