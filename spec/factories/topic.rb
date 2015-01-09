require 'faker'

FactoryGirl.define do
   factory :topic do
     topic "##{Faker::Lorem.word}"
   end
 end