class Bookmark < ActiveRecord::Base
  belongs_to :user
  has_many :favorites, dependent: :destroy

  default_scope { order('topic ASC')}



end
