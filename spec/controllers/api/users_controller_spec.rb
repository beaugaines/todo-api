require 'spec_helper'

describe Api::UsersController do

  before do
    User.destroy_all
  end

  describe "create" do
    
    it "creates and returns a new user from username and password params" do
      params = { "new_user" => { "username" => "testuser", "password" => "testpass" } }

      expect{ post :create, params }
        .to change{ User.where(params['new_user']).count }
        .by 1

      JSON.parse(response.body).should == { "user" => { "username" => "testuser", "password" => "testpass"}}
    end

    it "returns an error when not given a password" do
      post :create, { "new_user" => { "username" => "testuser" } }
      body = JSON.parse(response.body)
      expect(body['errors']).to eq ["Password can't be blank"]
    end

    it "returns an error when not given a username" do
      post :create, { "new_user" => { "password" => "password" } }
      body = JSON.parse(response.body)
      expect(body['errors']).to eq ["Username can't be blank"]
    end
  end

  describe "index" do

    before do 
      (1..3).each{ |n| User.create( id: n, username: "name#{n}", password: "pass#{n}" ) }
    end

    it "lists all usernames and ids" do
      get :index

      JSON.parse(response.body).should == 
        { 'users' => 
          [
            { 'username' => 'name1', 'password' => 'pass1' },
            { 'username' => 'name2', 'password' => 'pass2' },
            { 'username' => 'name3', 'password' => 'pass3' },
          ]
        }
    end
  end
end