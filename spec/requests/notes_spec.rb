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
  end
  
  path '/notes/{id}' do
    patch 'Updates an specific note (can be used to add custom comments)' do
      tags 'Notes'
      consumes 'application/json'
      parameter name: :id, in: :path, required: :true
      parameter name: :watched, in: :body, type: :boolean
      parameter name: :raiting, in: :body, type: :integer
      parameter name: :comment, in: :body, type: :string
      request_body_example value: {
        watched: true,
        raiting: 5,
        comment: 'Excelent movie!'
      }, name: '5_stars_comment', summary: '5 Stars Comment '
  
      response '200', 'Note updated' do
        run_test!
      end
    end
  end

end
