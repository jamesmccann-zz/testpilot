# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :app do
    sequence(:name) { |n|  "Test App #{n}" }
    after(:build) { |a| a.valid? }
  end
end
