class NotesController < ApplicationController
  def create
    # TODO: ADD VALIDATIONS FOR IMDB_IDs AND MESSAGES WHEN THE MOVIE IS CREATED
    if Note.find_or_create_by(imdb_id: params[:imdb_id])
      render json: {
        message: "The movie: #{ params[:title] } was added to local library as 'Unwatched'"
      }
    else
    end
  end
end
