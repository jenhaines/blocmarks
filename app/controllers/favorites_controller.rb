class FavoritesController < ApplicationController

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    favorite = current_user.favorites.build(bookmark: @bookmark)

    if favorite.save
      flash[:notice] = "Favorited bookmark"
      redirect_to :back

    else
      flash[:error] = "Unable to add favorite. Please try again."
      redirect_to :back
    end
  end

 def destroy
 @bookmark = Bookmark.find(params[:bookmark_id])
   favorite = current_user.favorites.find(params[:id])
   if favorite.destroy
     flash[:notice] = "Unfavorited bookmark"
     redirect_to :back
     
   else
    flash[:error] = "Unable to fulfill request. Please try again."
    redirect_to :back
   end
 end
end
