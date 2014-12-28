class Bookmarktopic < ActiveRecord::Base
  belongs_to :bookmark
  belongs_to :topic
end