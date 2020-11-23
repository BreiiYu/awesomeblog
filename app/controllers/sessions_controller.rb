class SessionsController < ApplicationController
  def new
  end
  #this reflects under sessions_helper.rb
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      render 'new'
    end
  end

  #from session helper this will destroy the session
  def destroy
    log_out
    redirect_to root_url
  end
end
