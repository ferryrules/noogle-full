class Folder < ApplicationRecord
  has_many :notes

  belongs_to :user

  has_many :user_folders
  has_many :users, through: :user_folders
  
end
