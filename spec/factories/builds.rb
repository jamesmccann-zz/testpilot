# Read about factories at https://github.com/thoughtbot/factory_girl

include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :build do
    apk { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'apks', 'test.apk')) }
  end
end
