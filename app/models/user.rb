# == Schema Information
# Schema version: 20100913153008
#
# Table name: users
#
#  id         :integer(4)      not null, primary key
#  login      :string(255)
#  jobID      :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :login, :email, :password, :password_confirmation
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :login, :presence   => true,
                    :uniqueness => { :case_sensitive => false }
  
  validates :email, :presence   => true,
                    :format     => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }
  
  #Automatically create the virtual attribute 'password_confirmation'
  validates :password,  :presence       => true,
                        :confirmation   => true,
                        :length         => { :within => 6..40 }
                        
  before_save :encrypt_password
  
  #Return true if the user's password matches the submitted password
  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end
  
  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil  if user.nil?
    return user if user.has_password?(submitted_password)
  end
    
  private
    
    def encrypt_password
      self.salt = make_salt if new_record?
      self.encrypted_password = encrypt(password)
    end
    
    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end
    
    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end
    
    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
end
