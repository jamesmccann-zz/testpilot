# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:full_name) { |n| "Test #{n} User #{n}" }
    sequence(:email) { |n| "user-#{n}@testpilotapp.com" }
    password { "testtest123" }
    confirmed_at { DateTime.now }

    trait :unconfirmed do
      confirmation_token 'abc123'
      confirmed_at nil
    end
  end
end
