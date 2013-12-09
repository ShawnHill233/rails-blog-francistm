class Entry < ActiveRecord::Base
  attr_accessible :content, :slug, :title, :user_id

  belongs_to :user

  validates :user, :presence => true, :associated => true
  validates :slug, :title, :content, :presence => true
  validates :slug, :uniqueness => { :case_sensitive => false }
end
