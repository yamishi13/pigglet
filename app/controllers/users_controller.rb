class UsersController < ApplicationController
  
  def new
    @user = User.new 
  end

  def edit
      if params[:id].to_s != session[:user_id].to_s
        redirect_to home_path
      else
        @user = User.find(params[:id])
      end
  end

  def update
    @user = User.find(params[:id])
 
    @user.update(users_params)
    redirect_to home_path
  end

  private
    def users_params
      params.require(:withdrawal).permit(:username, :password)
    end

end
