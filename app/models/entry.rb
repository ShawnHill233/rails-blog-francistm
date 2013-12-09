class Entry < ActiveRecord::Base
  attr_accessible :content, :slug, :title, :user_id

  belongs_to :user

  validates :user, :presence => true, :associated => true
  validates :slug, :title, :content, :presence => true
  validates :slug, :uniqueness => { :case_sensitive => false }
  
  def to_html
    return "" if content.blank?
    Kramdown::Document.new(content).to_html
  end

  def to_param
    self.slug
  end
end
