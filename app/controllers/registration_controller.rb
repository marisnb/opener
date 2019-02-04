class RegistrationController < ApplicationController

  def index
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render "session"
    else
      redirect_to  controller: "sessions" , action: "index"
    end
  end

  private
    def user_params
      params.require(:user).permit(:user_name,:password)
    end

end
