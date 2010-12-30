class PlayersController < ApplicationController
  before_filter :load_team
  
  def index
    @players = @team.players.all
  end
  
  def edit
    @player = @team.players.find(params[:id])
  end
  
  def update
     @player = @team.players.find(params[:id])#Player.where(:id => params[:user_id]).limit(1)
      if @player.update_attributes(params[:player])
        flash[:success] = "Profile updated."
        redirect_to (:back)
      else
        @title ="Edit user"
        render 'edit'
      end
  end
  
  def create
    @player = Player.new(params[:subject])
    
    if @player.save
      redirect_to(:action => 'index')
    else
      #new template not currently not available 27.12.10 H.H.
      render('new')
    end
  end
  
  def new
    @player = Player.new
    @title = "New"
  end
  
  private
  
  def load_team
    @team = Team.where(:id => params[:team_id]).first
  end
end
