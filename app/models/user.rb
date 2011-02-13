require 'digest'

class User < ActiveRecord::Base
  attr_accessor :password

  validates :username, :presence => true, 
                       :uniqueness => true
  
  validates :password, :confirmation => true,
                       :length => { :within => 1..60 },
                       :presence => true,
                       :if => :password_required?

  validates :email, :uniqueness => true,
                    :length => { :within => 5..100 },
                    :format => { :with => /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i }

  has_many :recipes, :order => 'title ASC',
                     :dependent => :nullify

  before_save :encrypt_new_password

  def self.authenticate(username, password)
    user = find_by_username(username)
    return user if user && user.authenticated?(password)
  end
  
   def authenticated?(password)
       self.hashed_password == encrypt(password)
         end

   protected
     def encrypt_new_password
       return if password.blank?
       self.hashed_password = encrypt(password)
     end

     def password_required?
       hashed_password.blank? || password.present?
     end

     def encrypt(string)
       Digest::SHA1.hexdigest(string)
     end
end
