require 'faker'

FactoryGirl.define do
   factory :bookmark do
     topic "##{Faker::Lorem.word}"
     address  Faker::Internet.url
   end
 end