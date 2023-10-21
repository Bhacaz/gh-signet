Rails.application.routes.draw do
  resources :admins
  root "home#index"

  get 'dashboard', to: 'dashboard#index'
  get 'auth/:provider/callback', to: 'login#create'
  resources :pr_signets do
    get :gh_pull_requests, on: :member
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
