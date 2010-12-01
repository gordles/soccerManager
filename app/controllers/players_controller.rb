class PlayersController < ApplicationController
  before_filter :load_team
  
  def index
    @players = @team.players.all
  end
  
  private
  def load_team
    @team = Team.where(:id => arams[:team_id]).first
  end
end
