class CreateTrainingDates < ActiveRecord::Migration
  def self.up
    create_table :training_dates do |t|
      t.integer :team_id
      t.datetime :date
      t.string :trainingtype
      t.integer :intensity
      t.text :description
      t.string :objective
      t.text :review

      t.timestamps
    end
  end

  def self.down
    drop_table :training_dates
  end
end
