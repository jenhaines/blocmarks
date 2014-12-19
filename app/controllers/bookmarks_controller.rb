class BookmarksController < ApplicationController

  def index
    @bookmarks = Bookmark.all
    @topics = @bookmarks.pluck(:topic).uniq
  end
end
