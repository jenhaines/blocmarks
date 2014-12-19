class User < ActiveRecord::Base
  has_many :bookmarks


  has_secure_password

  validates_uniqueness_of :email
end
