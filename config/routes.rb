Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"

  get "/register", to: "people#new"
  post "/register", to: "people#create", as: "people"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :people, only: [:index]
  get "/dashboard", to: "people#show", as: "person"
  get "/discover", to: "movies#discover", as: "discover"

  resources :movies, only: [:index, :show]

  namespace :admin do
    get "/dashboard", to: "dashboard#index"
    get "/admin/people/:id", to: "people#show"
  end
end
