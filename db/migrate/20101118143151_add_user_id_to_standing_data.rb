class AddUserIdToStandingData < ActiveRecord::Migration
  def self.up
    add_column :standing_datas, :user_id, :integer
    add_column :standing_datas, :firstname, :string
    add_column :standing_datas, :middlename, :string
    add_column :standing_datas, :lastname, :string
  end

  def self.down
    remove_column :standing_datas, :lastname
    remove_column :standing_datas, :middlename
    remove_column :standing_datas, :firstname
    remove_column :standing_datas, :user_id
  end
end
