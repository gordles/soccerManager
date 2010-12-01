class AddDivisionToTeams < ActiveRecord::Migration
  def self.up
    add_column :teams, :division, :string
    add_column :teams, :manTeam, :boolean
  end

  def self.down
    remove_column :teams, :manTeam
    remove_column :teams, :division
  end
end
