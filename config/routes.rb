Rails.application.routes.draw do
  root 'application#top'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  get "profile/:id", to: "users#profile", as: 'user_profile'
  patch	"profile/:id", to: "users#profile_update"
  resources :rooms do
    collection do
      get :post
      get :search
    end
  end
  resources :reserves
end
