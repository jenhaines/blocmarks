class User < ActiveRecord::Base
  has_many :bookmarks
  has_many :favorites, dependent: :destroy


  has_secure_password

  validates_uniqueness_of :email
end
