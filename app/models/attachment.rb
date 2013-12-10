class Attachment < ActiveRecord::Base
  attr_accessible :file_key, :user_id

  belongs_to :user

  validates :file_key, presence: true
  validates :user, associated: true, presence: true
end
