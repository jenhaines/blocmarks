class Topic < ActiveRecord::Base
  has_many :bookmarktopics
  has_many :bookmarks, through: :bookmarktopics

  def self.get_topics(user)
    Topic.joins(:bookmarks).where('bookmarks.user_id' => user.id)
  end
  
end
