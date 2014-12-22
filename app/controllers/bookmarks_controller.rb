class BookmarksController < ApplicationController
  before_filter :authorize

  def index
    @bookmarks = Bookmark.all
    @topics = @bookmarks.pluck(:topic).uniq
  end


  def current_bookmarks(topic)
    @bookmark = Bookmark.where topic: topic
  end
  
end
