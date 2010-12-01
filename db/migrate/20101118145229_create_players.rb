class CreatePlayers < ActiveRecord::Migration
  def self.up
    create_table :players do |t|
      t.integer :user_id
      t.string :primaryPosition
      t.string :secondPosition
      t.string :thirdPosition
      t.float :weight
      t.integer :Number
      t.integer :team_id
      t.string :foot
      t.date :inTeamSince

      t.timestamps
    end
  end

  def self.down
    drop_table :players
  end
end
