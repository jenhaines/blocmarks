class Bookmarktopic < ActiveRecord::Base
  belongs_to :bookmark
  belongs_to :topic
  # validates_uniqueness_of :bookmark_id, scope: :topic_id
end