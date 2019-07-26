class NotesController < ApplicationController

  def index
    notes = Note.all
    render json: notes
  end

  def create
    note = Note.create(note_params)
    render json: note
  end

  def edit
    note = Note.find(params[:id])
    note.update(note_params)
    render json: note
  end

  def show
    note = Note.find(params[:id])
    render json: note
  end

  def delete
    note = Note.find(params[:id])
    note.destroy
  end

  private

  def note_params
    params.permit(:note, :user_id, :folder_id, :url)
  end
end
