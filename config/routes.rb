require 'sidekiq/web'

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  mount Sidekiq::Web => '/sidekiq'

  resources :movies, only: :show
  get 'movies/search/:title', to: 'movies#search'
  get 'movies/email_pdf/:imdb_id', to: 'movies#send_pdf_email'
  resources :notes, only: :index
  get 'notes/create/:imdb_id/', to: 'notes#create' # This should be a POST, using GET just for the example

end
