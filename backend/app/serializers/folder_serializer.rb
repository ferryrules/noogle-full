class FolderSerializer < ActiveModel::Serializer
  has_many :notes

  belongs_to :user

  has_many :user_folders
  has_many :users, through: :user_folders

  attributes :id, :name, :username, :user, :notes

  def username
    self.object.user.username
  end

  def notes
    self.object.notes.map do |note|
      {id: note.id,
      note: note.note,
      url: note.url,
      created: note.created_at,
      updated: note.updated_at,
      folder_name: note.folder.name,
      username: note.user.username}
    end
  end

end
