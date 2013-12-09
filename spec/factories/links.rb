# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :link do
    site_url { Faker::Internet.url }
    site_name { Faker::Name.name }
  end
end
