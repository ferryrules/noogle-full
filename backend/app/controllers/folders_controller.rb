class FoldersController < ApplicationController

  def index
    folders = Folder.all
    render json: folders
  end

  def show
    folder = Folder.find(params[:id])
    render json: folder
  end

  def edit
    folder = Folder.find(params[:id])
    folder.update(folder_params)
    render json: folder
  end

  def create
    created_folder = Folder.create(folder_params)
    shared_folder = UserFolder.create(user_id: params[:user_id], folder_id: created_folder.id)
    render json: created_folder
  end

  def share
    folder = Folder.find(params[:id])
    shared_folder = UserFolder.create(user_id: params[:user_id], folder_id: folder.id)
    render json: folder
  end

  def notes
    folder = Folder.find(params[:id])
    render json: folder.notes
  end

  def delete
    UserFolder.all.each do |folder|
      folder.destroy if folder.folder_id === params[:id].to_i
    end
    created_folder = Folder.find(params[:id]).destroy
  end

  private

  def folder_params
    params.permit(:name, :user_id)
  end

end
