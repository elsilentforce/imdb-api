class NotesController < ApplicationController
  before_action :set_note, only: :update

  def index
    @notes = Note.all
    render json: @notes
  end

  def create
    @note = Note.new(note_params)

    if @note.save
      render json: { message: 'Successfully saved!' }, status: :ok
    elsif @note.errors.any?
      render json: { error: @note.errors.full_messages.first }, status: :unauthorized
    end
  end

  def update
    if @note.nil?
      render json: { message: 'Note not found, couldn\'t update' }, status: :not_found
    elsif @note.save
      render json: { message: 'Note updated!' }, status: :ok
    else
      render json: { error: @note.errors.full_messages.first }, status: :unauthorized
    end
  end

  private

  def note_params
    params.permit(:imdb_id, :title, :raiting, :watched, :comment, :status)
  end

  def set_note
    @note = Note.find_by(imdb_id: params[:id])
  end
end
