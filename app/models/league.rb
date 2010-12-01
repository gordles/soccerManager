# == Schema Information
# Schema version: 20101124134042
#
# Table name: leagues
#
#  id         :integer(4)      not null, primary key
#  leagueName :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class League < ActiveRecord::Base
  has_many :teams
end
