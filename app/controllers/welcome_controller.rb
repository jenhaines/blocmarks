class WelcomeController < ApplicationController
  def index
  end

  def show
    regexp = Regexp.new params[:regexp]
    body = params[:body]
    @welcome = (body.scan(regexp))
    render 'about'
  end


  def about
  end
end
