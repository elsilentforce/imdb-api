require 'sidekiq/web'

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  mount Sidekiq::Web => '/sidekiq'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  resources :notes, only: [:index, :create, :update]
  resources :movies, only: :show
  get 'movies/search/:title', to: 'movies#search'
  get 'movies/email_pdf/:imdb_id', to: 'movies#send_pdf_email'

end
