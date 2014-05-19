class Api::UsersController < ApplicationController

  respond_to :json

  def index
    @users = User.all
    render json: @users
  end
  

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user        
    else
      render json: { errors: @user.errors.full_messages }
    end
  end
  
  private

  def user_params
    params.require(:new_user).permit(:username, :password)
  end
  

end