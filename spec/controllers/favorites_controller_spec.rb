require 'rails_helper'
 
 describe FavoritesController do
 
   # include TestFactories
   # include Devise::TestHelpers
 
   before do 
     @user = create (:user)
     @topic = create (:topic)
     @bookmark = create (:bookmark, user: @user)

   end
 
   describe '#create' do
     it "creates a favorite for the current user and specified bookmark" do
       expect( @user.favorites.find_by_bookmark_id(@bookmark.id) ).to be_nil
 
       # bookmark :create, { bookmark_id: @bookmark.id }
 
       expect( @user.favorites.find_by_bookmark_id(@bookmark.id) ).not_to be_nil
     end
   end
 
   describe '#destroy' do
     xit "destroys the favorite for the current user and post" do
       favorite = @user.favorites.where(post: @post).create
       expect( @user.favorites.find_by_post_id(@post.id) ).not_to be_nil
 
       delete :destroy, { post_id: @post.id, id: favorite.id }
 
       expect( @user.favorites.find_by_post_id(@post.id) ).to be_nil
     end
   end
 end