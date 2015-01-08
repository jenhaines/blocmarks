class BookmarksController < ApplicationController
  before_filter :authorize

  def index
    @user = current_user

    if (params.has_key?(:id) && params.has_key?(:topic))
      # @topics = @user.get_topics
      @topic = Topic.find(params[:topic])
      @bookmarks = @user.bookmarks.topic_bookmarks(@topic)
    elsif params[:id].to_i == @user.id 
      @bookmarks = @user.bookmarks
      @likes = @user.favbookmarks
      render 'home'      
    elsif params.has_key?(:topic)
      @topic = Topic.find(params[:topic])
      @bookmarks = @topic.bookmarks
    else
      @bookmarks = Bookmark.all
    end
  end
  
  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.orphan_check unless @bookmark.topics.nil?

    if @bookmark.destroy
      flash[:notice] = "Bookmark was deleted successfully."
      redirect_to :back
    else
      flash[:error] = "There was an error deleting the bookmark."
      redirect_to :back
    end
  end

end
