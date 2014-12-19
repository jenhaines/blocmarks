require 'faker'

FactoryGirl.define do
   factory :user do
     name { Faker::Name.name }
     email { Faker::Internet.email }
     password "helloworld" 
     password_confirmation 'helloworld'
   end
 end