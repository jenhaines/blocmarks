class Bookmark < ActiveRecord::Base
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :bookmarktopics
  has_many :topics, through: :bookmarktopics

  after_create :set_embedly_url


  default_scope { order('created_at DESC')}

  def orphan_check
    self.topics.each { |t| t.destroy! if t.bookmarks.count == 1 }
  end


private
  def set_embedly_url
    api = Embedly::API.new :key => ENV['EMBEDLY_API_KEY'], :user_agent => 'Mozilla/5.0 (compatible; mytestapp/1.0; my@email.com)'
    obj = api.oembed :url => self.address
    image = obj[0].thumbnail_url
    title = obj[0].title
    unless image.nil?
      img_resize = URI.parse("http://i.embed.ly/1/display/fill?height=160&width=202&color=000&url=#{image}&key=#{ENV['EMBEDLY_API_KEY']}")
    else
      img_resize = ""
    end
    update_attribute(:thumbnail_url, img_resize.to_s)
    update_attribute(:title, title)
  end

end