class NoteSerializer < ActiveModel::Serializer
  belongs_to :folder
  belongs_to :user

  attributes :id, :note, :url, :username, :user, :folder, :created_at, :updated_at

  def username
    self.object.user.username
  end
  
end
