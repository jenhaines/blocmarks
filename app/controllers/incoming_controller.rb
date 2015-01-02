class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]

  def create

    if params.has_key?(:sender)
      sender = User.where(:email => params[:sender]).first
      unless sender.nil?
        puts "SENDER FOUND"
        if params.has_key?(:subject)
          subject = params[:subject]
          tops = subject.scan(/#\S+/)
          puts "HASHTAGS #{tops}"
        end
        if params.has_key?(:'body-plain')
          body = params[:'body-plain']
          address = body.scan(/https?:\/\/[\S]+/)
          puts "URLS #{address}"
        end

        #Create Topics
        current_topics = tops.map {|t| Topic.where(topic: t).first_or_create }

        #Create bookmark topics
        address.each do |a|
          b = sender.bookmarks.create( address: a)
          current_topics.each{ |tp| b.bookmarktopics.create(topic: tp)}
        end

      end
    end
    head 200
  end
end