# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :attachment do
    user
    file_key { Faker::Lorem.word }
  end
end
