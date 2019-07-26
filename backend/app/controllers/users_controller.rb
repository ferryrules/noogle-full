class UsersController < ApplicationController

  def index
    users = User.all
    render json: users
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def create
    user = User.create(user_params)
    # byebug
    is_valid = user.valid?
    # in application controller
    if is_valid
      render json: user
    else
      render json: { error: "Wrong username or password" }
    end
  end

  def profile
    user = User.find(user_id)
    render json: user
  end

  private

  def user_params
    params.permit(:username, :password, :name)
  end

end
