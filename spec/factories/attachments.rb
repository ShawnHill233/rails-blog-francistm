# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :attachment do
    user
    file_key { "attachment.jpg" }
    file {
      Rack::Test::UploadedFile.new(
        Rails.root.join("spec", "files", "attachment.jpg"),
        "image/jpg"
      )
    }
  end
end
