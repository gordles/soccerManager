class UsersController < ApplicationController
 
  def show
    @user = User.find(params[:id])
    @title = @user.login
  end
  
  def new
    @title = "Sign up"
  end

end
