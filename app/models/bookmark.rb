class Bookmark < ActiveRecord::Base
  belongs_to :user

  default_scope { order('topic ASC')}



end
