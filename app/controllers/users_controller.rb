class UsersController < ApplicationController
  before_action :authentication_required

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to '/users'
      else
        redirect_to '/users/new'
      end
  end

  def index
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
