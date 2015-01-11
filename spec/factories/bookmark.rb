require 'faker'

FactoryGirl.define do
   factory :bookmark do
      user  
      topic {Topic.create(topic: "##{Faker::Lorem.word}")}
     address  Faker::Internet.url
   end
 end