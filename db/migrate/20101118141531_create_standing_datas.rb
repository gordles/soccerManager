class CreateStandingDatas < ActiveRecord::Migration
  def self.up
    create_table :standing_datas do |t|
      t.date :birthday
      t.string :birthcountry
      t.string :nationality
      t.string :mobilephone
      t.string :street
      t.string :city
      t.string :zip

      t.timestamps
    end
  end

  def self.down
    drop_table :standing_datas
  end
end
