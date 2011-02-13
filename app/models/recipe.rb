class Recipe < ActiveRecord::Base
  
  validates :title, :presence => true
  validates :ingredients, :presence => true
  validates :disc, :presence => true

  belongs_to :user
end
