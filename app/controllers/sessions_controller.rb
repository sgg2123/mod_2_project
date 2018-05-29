class SessionsController < ApplicationController


  def new

  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      redirect_to @user
    else
      flash[:errors] = "Cannot find the fucking user or verify the password so get the fuck out."
      redirect_to login_path
    end
  end



end
