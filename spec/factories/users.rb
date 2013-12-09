# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    salt { Faker::Lorem.characters(15) }
    email { Faker::Internet.email }
    username { Faker::Internet.user_name }
    crypted_password { |user| Sorcery::CryptoProviders::BCrypt.encrypt( Faker::Lorem.characters(6), user.salt ) }
  end
end
