class SessionsController < ApplicationController
  def new
  end

  def create
      user = User.find_by(user_name: params[:session][:user_name]).try(:authenticate, params[:session][:password])
      if user
        log_in user
        redirect_to  controller: "home" , action: "index"
      else
        flash.now[:alert] = "Username or password is invalid"
        render 'new'
      end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
