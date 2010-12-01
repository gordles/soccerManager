# == Schema Information
# Schema version: 20101122131324
#
# Table name: jobs
#
#  id         :integer(4)      not null, primary key
#  jobTitle   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Job < ActiveRecord::Base
  attr_accessible :jobTitle
  
  has_many :users, :dependent => :nullify 
  
  validates :jobTitle, :presence => true,
            :uniqueness => { :case_sensitive => false }
  
end
