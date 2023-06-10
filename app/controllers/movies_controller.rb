class MoviesController < ApplicationController

  def show
    imdb_id = params[:id]
    response = MovieFinder.call(imdb_id)
    response.merge!("send_pdf_by_email" => "/movies/email_pdf/#{imdb_id}")
    render json: response
  end

  def search
    response = MovieSearcher.call(params[:title])["Search"]
    response.map { _1.merge!("details_url" => "/movies/#{ _1["imdbID"] }") }
    render json: response
  end

  def send_pdf_email   
    begin
      movie = MovieFinder.call(params[:imdb_id])
      MovieDetailMailerJob.perform_async(recipient: 'app_user@some_email.domain', movie: movie)
      render json: { message: 'Email sent!' }, status: :ok
    rescue => e
      render json: { error: e.to_s }, status: :internal_server_error
    end
  end

end
