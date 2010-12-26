class PlayersController < ApplicationController
  before_filter :load_team
  
  def index
    @players = @team.players.all
  end
  
  def edit
    @player = @team.players.find(params[:id])
  end
  
  def update
     @player = Player.where(:id => params[:user_id]).first
      if @player.update_attributes(params[:player])
        flash[:success] = "Profile updated."
        redirect_to (:back)
      else
        @title ="Edit user"
        render 'edit'
      end
  end
  
  private
  def load_team
    @team = Team.where(:id => params[:team_id]).first
  end
end
