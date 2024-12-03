class Users::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def check_user_exists
    user_exists = User.exists?(["lower(name) = ? OR lower(email) = ?", params[:name].downcase, params[:email].downcase])

    render json: { exists: user_exists }
  end
end