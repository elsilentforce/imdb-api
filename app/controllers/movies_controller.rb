# TODO: ADD VERSIONED CONTROLLERS AND ROUTES

class MoviesController < ApplicationController

  def show
    response = MovieFinder.call(params[:id])
    response.merge!(
      "save_watched" => "/notes/save/#{ params[:id] }/watched",
      "save_unwatched" => "/notes/save/#{ params[:id] }/unwatched"
    )
    render json: response
  end

  def search
    response = MovieSearcher.call(params[:title])["Search"]
    response.map { _1.merge!("details_url" => "/movies/#{ _1["imdbID"] }") }
    render json: response
  end

  def test_job
    movie = MovieFinder.call('tt0126029')
    email = 'native.devil@gmail.com'
    # MovieDetailMailerJob.perform_now(recipient: email, movie: movie)
    render json: { message: 'ok' }, status: :ok
  end

end
