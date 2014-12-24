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
  
  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def topic
    @user = current_user
    @topic = params[:topic]
    @bookmarks = Bookmark.current_topic(@topic)
  end

end
