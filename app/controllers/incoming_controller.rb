class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]

  def create

    if params.has_key?(:sender)
      sender = User.where(:email => params[:sender]).first
      unless sender.nil?
        if params.has_key?(:subject)
          subject = params[:subject] 
          topic = (/#\S+/.match(subject)).to_s
        end
        if params.has_key?(:'body-plain')
          body = params[:'body-plain']
          address = (/https?:\/\/[\S]+/.match(body)).to_s
        end
        bookmark = sender.bookmarks.build(address: address, topic: topic )
        if bookmark.save
          puts "Bookmark created for #{sender.name}"
          puts "Topic #{topic}"
          puts "URL #{address}"
          UserMailer.acknowledge_email(sender).deliver
        else
          puts "BOOKMARK WAS NOT SAVED, check error logs"
        end
      end
    end
    head 200
  end
end