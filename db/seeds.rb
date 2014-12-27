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
topics=[]
8.times {topics << "##{Faker::Lorem.word}"}

#make some real Urls
urls = ["http://www.yahoo.com","http://www.msn.com", "http://www.google.com", "http://www.sfgate.com",
  "http://www.stltoday.com", "http://www.nhl.com", "http://www.huffingtonpost.com", "http://www.slickdeals.net", 
  "http://www.newyorktimes.com"]



 # Create bookmarks
 20.times do
   Bookmark.create!(
     user:   users.sample,
     topic:  topics[rand(20)],
     # address:   Faker::Internet.url
     address: urls[rand((urls.length-1))]
   ) 
 end
 bookmarks = Bookmark.all
 
 puts "Seed finished"
 puts "#{users.count} users created"
 puts "#{bookmarks.count} bookmarks created"