class BookmarksController < ApplicationController
  before_filter :authorize

  def index
    @user = current_user
    if params[:id].to_i == @user.id 
      @bookmarks = @user.bookmarks
    else
      @bookmarks = Bookmark.all
    end
    @topics = @bookmarks.pluck(:topic).uniq
  end


  def current_bookmarks(topic)
    @bookmark = Bookmark.where topic: topic
  end
  
end
