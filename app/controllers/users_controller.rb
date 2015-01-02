class UsersController < ApplicationController

  def new
     @user = User.new
   end
   
   def create
     @user = User.new(user_params)
     if @user.save
      session[:user_id] = @user.id
      redirect_to bookmarks_path, notice: "Thank you for signing up!"
      UserMailer.welcome_email(@user).deliver
     else
       render "new"
     end
   end

private

  def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
