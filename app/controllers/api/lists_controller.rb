module Api
  class ListsController < Api::BaseController

    private

    def list_params
      params.require(:new_list).permit(:name, :user_id, :permissions)
    end

    def query_params
      params.permit(:list_id, :name)
    end
  end
end