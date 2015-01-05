require 'faker'
 
 # Create Users
 8.times do
   user = User.new(
     name:     Faker::Name.name,
     email:    Faker::Internet.email,
     password: 'welcome'
   )
   user.save!
 end
 users = User.all

#Create a known email
admin = User.new(
  name:     'Admin User',
  email:    'admin@example.com',
  password: 'welcome',
)
admin.save

#make some topics
10.times do |t|
  topic = Topic.new( topic: "##{Faker::Lorem.word}#{t}")
  topic.save!
end
topics = Topic.all

#make some real Urls
urls = ["http://www.yahoo.com","http://www.msn.com", "http://www.google.com", "http://www.sfgate.com",
  "http://www.stltoday.com", "http://www.nhl.com", "http://www.huffingtonpost.com", "http://www.slickdeals.net", 
  "http://www.newyorktimes.com", "http://www.youtube.com", "http://www.vimeo.com"]

 # Create bookmarks
 20.times do
   Bookmark.create!(
     user:   users.sample,
     address: urls[rand((urls.length-1))]
   ) 
 end
 bookmarks = Bookmark.all

 #Create HAMT
 bookmarks.each do |b|
  c = rand(1..3)
  c.times { b.topics << topics.sample}
  b.save!
end


 
 puts "Seed finished"
 puts "#{users.count} users created"
 puts "#{topics.count} topics created"
 puts "#{bookmarks.count} bookmarks created"