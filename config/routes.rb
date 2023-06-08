Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :movies, only: :show
  get 'movies/search/:title', to: 'movies#search'

  resources :notes, only: :create

end
