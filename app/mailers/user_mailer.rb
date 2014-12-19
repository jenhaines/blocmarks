class UserMailer < ActionMailer::Base
  default from: "burtbondi@gmail.com"

  def welcome_email(user)
    @user = user
    @url = 'https://blocmarks-jh.herokuapp.com/'
    mail(to: @user.email, subject: 'Welcome to my awesome site')
  end

  def receive(email)
    puts email[params]
  end

  def acknowledge_email(user)
    @user = user
    @url = 'https://blocmarks-jh.herokuapp.com/'
    mail(to: @user.email, subject: 'Your Blockmark is posted.')
  end


end
