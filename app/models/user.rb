class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :email, :username, :password

  validates :email, :username, :presence => true
  validates :email, :username, :uniqueness => { :case_sensitive => false }

  has_many :entries, dependent: :restrict
  has_many :attachments, dependent: :restrict
end
