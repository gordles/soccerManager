class TeamsController < ApplicationController
  respond_to :html, :xml
  
  def index
    @teams = Team.all
    respond_with @teams
  end
  
  def show
    @team = Team.find(params[:id])
  end
   
end
