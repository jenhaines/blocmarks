class BookmarksController < ApplicationController
  before_filter :authorize

  def index
    @user = current_user
    if params[:id].to_i == @user.id 
      @bookmarks = @user.bookmarks      
    elsif params.has_key?(:topic)
      @bookmarks = Topic.find(params[:topic]).bookmarks
    else
      @bookmarks = Bookmark.all
    end
    @topics = Topic.all
  end
  
  def show
    @bookmark = Bookmark.find(params[:id])
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
