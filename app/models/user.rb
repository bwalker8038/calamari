class User < ActiveRecord::Base
  validates :username, :presence => true, 
                       :uniqueness => true,
  
  validates :password, :confirmation => true

  validates :email, :uniqueness => true,
                    :length => { :within => 5..100 },
                    :format => { :with => /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i }

  has_many :recipes, :order => 'title ASC',
                     :dependent => :nullify
end
