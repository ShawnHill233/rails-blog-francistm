# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :entry do
    slug { Faker::Lorem.word }
    title { Faker::Lorem.paragraph(1) }
    content { Faker::Lorem.paragraph(5) }
    user
  end
end
