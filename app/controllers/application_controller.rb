class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  before_filter :setup_navigation
  
  private 
  
  def setup_navigation
    @teams = Team.all
  end
end
