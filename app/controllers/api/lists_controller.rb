class Api::ListsController < ApplicationController

  respond_to :json

  def index
    @lists = List.all
    render json: @lists
  end

  def show
    
  end
  

  def create
    @user = User.find(params['new_list']['user_id'])
    password = params['user']['password'] rescue nil
    if @user.authenticate?(password)
      @list = List.create(list_params) 
      render json: @list
    else
      render json: { status: :error }
    end
  end
  
  private

  def list_params
    params.require(:new_list).permit(:name, :user_id, :permissions)
  end
end