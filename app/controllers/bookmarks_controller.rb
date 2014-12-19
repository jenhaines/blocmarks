class BookmarksController < ApplicationController
  before_filter :authorize

  def index
    @bookmarks = Bookmark.all
    @topics = @bookmarks.pluck(:topic).uniq
  end
end
