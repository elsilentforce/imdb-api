require 'swagger_helper'

describe 'Notes API' do
  path '/notes' do
    get 'List all your personal notes' do
      tags 'Notes'
      consumes 'application/json'

      response '200', 'Personal notes list' do
        run_test!
      end
    end

    post 'Creates a new Personal Note' do
      tags 'Notes'
      consumes 'application/json'
      parameter name: :imdb_id, in: :body, type: :string, required: :true
      parameter name: :title, in: :body, type: :string, required: :true
      parameter name: :watched, in: :body, type: :boolean
      parameter name: :raiting, in: :body, type: :integer
      parameter name: :comment, in: :body, type: :string
      request_body_example value: {
        imdb_id: 'tt0126029',
        title: 'Shrek',
        watched: false,
        raiting: nil,
        comment: nil
      }, name: 'unwatched_movie_save', summary: 'A default save to local Notes as Unwatched'

      response '200', 'Personal Note created' do
        run_test!
      end

      response '401', 'IMDB ID has already been taken' do
        run_test!
      end

    end
  end
  
  path '/notes/{imbd_id}' do
    
    path '/notes/{imdb_id}' do
      put 'Updates a personal Note' do
        tags 'Notes'
        consumes 'application/json'
        produces 'application/json'
        parameter name: :imdb_id, in: :path, type: :string, required: :true
        parameter name: :watched, in: :body, type: :boolean
        parameter name: :raiting, in: :body, type: :integer
        parameter name: :comment, in: :body, type: :string
        request_body_example value: {
          watched: true,
          raiting: 5,
          comment: 'Excelent movie!'
        }, name: '5_stars_comment', summary: '5 Stars Comment'
    
        response '200', 'Movie details' do
          run_test!
        end
      end
    end
  end

end
