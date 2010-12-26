# == Schema Information
# Schema version: 20101122131324
#
# Table name: players
#
#  id              :integer(4)      not null, primary key
#  user_id         :integer(4)
#  primaryPosition :string(255)
#  secondPosition  :string(255)
#  thirdPosition   :string(255)
#  weight          :float
#  Number          :integer(4)
#  team_id         :integer(4)
#  foot            :string(255)
#  inTeamSince     :date
#  created_at      :datetime
#  updated_at      :datetime
#

class Player < ActiveRecord::Base
  belongs_to :user
  belongs_to :team
  
  validates :primaryPosition, :presence => true
  
  attr_accessible :primaryPosition, :foot, :Number, :weight, :inTeamSince
  
  accepts_nested_attributes_for :user
  
end
