# == Schema Information
# Schema version: 20101122131324
#
# Table name: training_dates
#
#  id           :integer(4)      not null, primary key
#  team_id      :integer(4)
#  date         :datetime
#  trainingtype :string(255)
#  intensity    :integer(4)
#  description  :text
#  objective    :string(255)
#  review       :text
#  created_at   :datetime
#  updated_at   :datetime
#

class TrainingDate < ActiveRecord::Base
  belongs_to :teams
  
  validates :date, :presence => true
end
