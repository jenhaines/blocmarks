class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def authorize
    redirect_to login_url, alert: "Please log in first to view topics." if current_user.nil?
  end

  def topics
    @topics = Topic.all
  end

  def my_topics
    @my_topics = Topic.get_topics(current_user).uniq
  end


 private
   def current_user
     @current_user ||= User.find(session[:user_id]) if session[:user_id]
   end

   helper_method :current_user, :topics, :my_topics
end
