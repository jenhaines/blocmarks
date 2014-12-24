require 'faker'
 
 # Create Users
 15.times do
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
20.times {topics << "##{Faker::Lorem.word}"}


 # Create bookmarks
 80.times do
   Bookmark.create!(
     user:   users.sample,
     topic:  topics[rand(20)],
     address:   Faker::Internet.url
   ) 
 end
 bookmarks = Bookmark.all
 
 puts "Seed finished"
 puts "#{users.count} users created"
 puts "#{bookmarks.count} bookmarks created"