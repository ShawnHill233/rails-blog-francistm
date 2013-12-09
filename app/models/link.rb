class Link < ActiveRecord::Base
  attr_accessible :site_name, :site_url

  validates :site_url, :site_name, :presence => true
  validates :site_name, :uniqueness => { :case_sensitive => false }
end
