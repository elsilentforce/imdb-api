require 'sidekiq/web'

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  mount Sidekiq::Web => '/sidekiq'

  resources :movies, only: :show
  get 'movies/search/:title', to: 'movies#search'
  get 'test_job', to: 'movies#test_job'

  resources :notes, only: :create

end
