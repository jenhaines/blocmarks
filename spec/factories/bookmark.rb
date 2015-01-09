require 'faker'

FactoryGirl.define do
   factory :bookmark do
     address  Faker::Internet.url
     topic create(:topic)
   end
 end