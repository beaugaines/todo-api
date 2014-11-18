module API
  class ListsController < API::BaseController

    private

    def list_params
      params.require(:new_list).permit(:name, :user_id, :permissions)
    end

    def query_params
      params.permit(:id)
    end
  end
end