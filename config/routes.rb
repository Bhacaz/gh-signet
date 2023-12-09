Rails.application.routes.draw do
  root "home#index"

  get 'dashboard', to: 'dashboard#index'
  get 'dashboard/hide_offcanvas_details', to: 'dashboard#hide_offcanvas_details'
  get 'auth/:provider/callback', to: 'login#create'
  get 'logout', to: 'login#logout'
  delete 'user', to: 'user#delete'

  resources :pr_signets do
    get :gh_pull_requests, on: :member
    patch :toggle_expanded, on: :member
    get :preview, on: :collection
  end

  get 'pull_requests/details', to: 'pull_requests#details', as: :pull_request_details
  get 'pull_requests/show_loading_offcanvas_details', to: 'pull_requests#show_loading_offcanvas_details'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
