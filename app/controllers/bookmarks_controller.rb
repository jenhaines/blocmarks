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

  def destroy
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.destroy
      flash[:notice] = "Bookmark was deleted successfully."
      redirect_to :back
    else
      flash[:error] = "There was an error deleting the bookmark."
      redirect_to :back
    end
  end

end
