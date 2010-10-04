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
  attr_accessor :login, :jobID
  
  validates :login, :presence   => true,
                    :uniqueness => { :case_sensitive => false }
  
  validates :jobID, :presence => true
end
