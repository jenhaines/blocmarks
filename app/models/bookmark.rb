class Bookmark < ActiveRecord::Base
  belongs_to :user
  has_many :favorites, dependent: :destroy

  after_create :set_embedly_url


  default_scope { order('topic ASC')}

  def self.current_topic(topic)
    where(topic: topic)
  end

  def set_embedly_url
    api = Embedly::API.new :key => ENV['EMBEDLY_API_KEY'], :user_agent => 'Mozilla/5.0 (compatible; mytestapp/1.0; my@email.com)'
    obj = api.oembed :url => self.address
    image = obj[0].thumbnail_url
    title = obj[0].title
    update_attribute(:thumbnail_url, image)
    update_attribute(:title, title)
  end

  

end
