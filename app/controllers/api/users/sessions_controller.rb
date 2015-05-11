class Users::SessionsController < Devise::SessionsController

  def create
    self.resource = warden.authenticate!(auth_options)
    # ^Or whatever custom logic you would like to use here.
    token = Tiddle.create_and_return_token(resource, request)
    render json: { authentication_token: token }
  end

  def destroy
    Tiddle.expire_token(current_user, request)
    render json: {}
  end
end