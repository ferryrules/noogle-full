class User < ApplicationRecord
  has_many :folders

  has_many :user_folders
  has_many :folders, through: :user_folders

  has_many :notes

  has_secure_password
end
