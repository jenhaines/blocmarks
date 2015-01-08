class User < ActiveRecord::Base
  has_many :bookmarks
  has_many :favorites, dependent: :destroy
  has_many :favbookmarks, through: :favorites, source: :bookmark

  has_secure_password

  validates :name, presence: true
  validates_uniqueness_of :email

  def favorited(bookmark)
     favorites.where(bookmark_id: bookmark.id).first
  end
end
