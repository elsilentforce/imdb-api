class NotesController < ApplicationController

  def create
    @note = Note.new(imdb_id: params[:imdb_id], watched: set_status)
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
