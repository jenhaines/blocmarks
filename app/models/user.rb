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

  def get_topics
    Topic.joins(bookmarks: :topics).where('bookmarks.user_id' => self)
  end

  def get_topic_bookmarks(topic)
    Bookmark.joins(:topics).where('bookmarks.user_id = ? AND topic.id = ? ', self, topic)
  end
end
