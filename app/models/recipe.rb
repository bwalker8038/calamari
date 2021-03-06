class Recipe < ActiveRecord::Base
  
  validates :title, :presence => true
  validates :ingredients, :presence => true
  validates :disc, :presence => true
  
  belongs_to :user
  has_and_belongs_to_many :categories
  
  scope :where_title, lambda { |term| where("articles.title LIKE ?", "%#{term}%") }
  
  def owned_by?(owner)
    return false unless owner.is_a? User
    user == owner
  end    
end
