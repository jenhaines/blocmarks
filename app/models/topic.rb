class Topic < ActiveRecord::Base
  has_many :bookmarktopics
  has_many :bookmarks, through: :bookmarktopics
  
end
