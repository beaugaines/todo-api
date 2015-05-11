class API::SessionsController < Devise::SessionsController

  respond_to :json

  skip_before_action :verify_authenticity_token
  # prepend_before_filter :require_no_authentication, only: [:create]


  def create
    self.resource = warden.authenticate!(scope: :user)
    token = Tiddle.create_and_return_token(resource, request)
    render json: { authentication_token: token }
  end

  def destroy
    Tiddle.expire_token(current_user, request)
    render json: {}
  end

  private
  # this is invoked before destroy and we have to override it
  def verify_signed_out_user
  end
  
end