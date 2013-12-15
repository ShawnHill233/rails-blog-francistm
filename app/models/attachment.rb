class Attachment < ActiveRecord::Base
  attr_accessible :file_key, :user_id

  belongs_to :user

  validates :file_key, presence: true
  validates :user, associated: true, presence: true

  def to_url
    "#{Settings.qiniu[:share_link]}/#{self.file_key}"
  end
end
