class UsersController < ApplicationController
  def show
    @user = User.find_by({ "id" => params["id"] })
  end

  def new
  end

  def create
    if User.find_by({"email" => params["email"].lowercase})
    redirect_to "/login"
  else 
    @user = User.new
    @user["first_name"] = params["first_name"]
    @user["last_name"] = params["last_name"]

    @user["email"] = params["email"]
    # @user["password"] = params["password"]
    @user["password"] = BCrypt::Password.create(params["password"])
    @user.save
    redirect_to "/users/#{@user["id"]}"
  end
end
