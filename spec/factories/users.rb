# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user-#{n}@testpilotapp.com" }
    password { "testtest123" }
  end
end
