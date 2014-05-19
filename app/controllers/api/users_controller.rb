class Api::UsersController < ApplicationController

  respond_to :json

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user        
    else
      render json: { success: false }
    end
  end
  
  private

  def user_params
    params.require(:new_user).permit(:username, :password)
  end
  

end