require 'swagger_helper'

describe 'Movies API' do
  path '/movies/search/{title}' do
    get 'Search movies by Title into OMDB API' do
      tags 'Movies'
      consumes 'application/json'
      parameter name: :title, in: :path, type: :string, required: true

      response '200', 'search result' do
        run_test!
      end
    end
  end

  path '/movies/{imdb_id}' do
    get 'Retrieves a Movie by its IMDB ID' do
      tags 'Movies'
      produces 'application/json'
      parameter name: :imdb_id, in: :path, type: :string, required: :true
      request_body_example value: { some_field: 'Foo' }, name: 'basic', summary: 'Request example description'

      response '200', 'Movie details' do
        run_test!
      end
    end
  end

end
