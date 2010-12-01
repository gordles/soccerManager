# == Schema Information
# Schema version: 20101122131324
#
# Table name: standing_datas
#
#  id           :integer(4)      not null, primary key
#  birthday     :date
#  birthcountry :string(255)
#  nationality  :string(255)
#  mobilephone  :string(255)
#  street       :string(255)
#  city         :string(255)
#  zip          :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  user_id      :integer(4)
#  firstname    :string(255)
#  middlename   :string(255)
#  lastname     :string(255)
#

class Standingdata < ActiveRecord::Base
  belongs_to :user #foreign key - user_id
  
  attr_accessible :id, :birthday
  
  validates :birthday, :presence => true
  
  #validates :birthcountry, :presence => true
  
  #validates :nationality, :presence => true
  
  validates :firstname, :presence => true
  
  validates :lastname, :presence => true
end
