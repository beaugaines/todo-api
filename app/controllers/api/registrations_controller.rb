class API::RegistrationsController < Devise::RegistrationsController

  respond_to :json

  skip_before_action :verify_authenticity_token, only: [:create]
  
  def create
    user = User.new(user_params)
    if user.save
      render json: user.as_json(email: user.email), status: 201
      return
    else
      warden.custom_failure!
      render json: user.errors, status: 422
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :email)
  end
  
  
end