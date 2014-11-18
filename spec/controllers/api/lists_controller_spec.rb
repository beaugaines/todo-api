require 'spec_helper'

describe API::ListsController do 

  before do
    User.destroy_all
  end

  before do
    @user = User.create!(username: 'Guy Guyly', password: 'password')
  end

  describe "create" do
    context "with correct user's password" do
      it "takes a name and user_id and creates a list" do
        params = { "user" => { "password" => "password"}, "new_list" => { "user_id" => "1", "name" => "shopping" }}
        expect { post :create, params }
          .to change{ List.where(params["new_list"]).count }
          .by(1)
        end
      end

    context "without correct user's password" do
      it "it errors ", focus: true do
        params = { "new_list" => { "user_id" => "1", "name" => "shopping" }}
        post :create, params
      end
    end
  end

  describe "index" do
    context "with correct user's password" do
      xit "returns all lists associated with the user"
    end

    context "without correct user's password" do
      xit "returns all visible and open lists"
    end
  end
end