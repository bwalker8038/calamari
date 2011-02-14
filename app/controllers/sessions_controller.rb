class SessionsController < ApplicationController
  def create
    if user = User.authenticate(params[:username], params[:password])
      session[:user_id] = user.id
      redirect_to root_path, :notice => "Logged in successfully"
    else
      flash.now[:alert] = "Invalid username/password combination"
      render :action => 'new'
    end
  end

  def destroy
    reset_session
    redirect_to root_path, :notice => "You've successfully logged out"
  end
end
