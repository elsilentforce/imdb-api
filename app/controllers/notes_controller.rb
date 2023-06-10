class NotesController < ApplicationController

  def index
    @notes = Note.all
    render json: @notes
  end

  def create
    @movie = MovieFinder.call(params[:imdb_id])
    @note = Note.new(imdb_id: params[:imdb_id], title: @movie['Title'], watched: set_status)
    if @note.save
      render json: { message: 'Comments saved!' }, status: :ok
    elsif @note.errors.any?
      render json: { error: @note.errors.full_messages.first }, status: :internal_server_error
    end
  end

  private

  def set_status
    params[:status].eql? 'watched'
  end
end
