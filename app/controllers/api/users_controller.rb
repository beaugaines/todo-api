module API
  class UsersController < API::BaseController

    private

    def user_params
      params.require(:new_user).permit(:username, :password)
    end

    def query_params
      params.permit(:id, :email)
    end

  end
end
