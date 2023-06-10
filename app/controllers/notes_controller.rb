class NotesController < ApplicationController
  before_action :set_movie, only: :create
  before_action :set_note, only: :update

  def index
    @notes = Note.all
    render json: @notes
  end

  def create
    @note = Note.new(note_params)
    @note.title = @movie['Title']

    if @note.save
      render json: { message: 'Successfully saved!' }, status: :ok
    elsif @note.errors.any?
      render json: { error: @note.errors.full_messages.first }, status: :internal_server_error
    end
  end

  def update
    if @note.save
      render json: { message: 'Successfully updated!' }, status: :ok
    else
      render json: { error: @note.errors.full_messages.first }, status: :internal_server_error
    end
  end

  private

  def note_params
    params.permit(:imdb_id, :title, :raiting, :watched, :comment, :status)
  end

  def set_status
    note_params[:status].eql? 'watched'
  end

  def set_movie
    @movie = MovieFinder.call(params[:imdb_id])
  end

  def set_note
    @note = note.find_by(imdb_id: note_params[:imdb_id])
  end
end
