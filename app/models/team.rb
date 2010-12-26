# == Schema Information
# Schema version: 20101124134042
#
# Table name: teams
#
#  id         :integer(4)      not null, primary key
#  teamName   :string(255)
#  league_id  :integer(4)
#  created_at :datetime
#  updated_at :datetime
#  division   :string(255)
#  manTeam    :boolean(1)
#

class Team < ActiveRecord::Base
  has_many :players, :dependent => :nullify
  has_many :training_dates
  belongs_to :leagues
  
  accepts_nested_attributes_for :players
  
  validates :teamName, :presence => true
  
end
