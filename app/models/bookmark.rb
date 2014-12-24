class Bookmark < ActiveRecord::Base
  belongs_to :user
  has_many :favorites, dependent: :destroy

  default_scope { order('topic ASC')}

  def self.current_topic(topic)
    where(topic: topic)
  end
  

end
