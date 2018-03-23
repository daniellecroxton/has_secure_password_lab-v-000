class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:name])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to '/users'
      else
        return head(:forbidden)
        redirect_to '/login'
      end

      def destroy
        reset_session
        redirect_to login_path
      end

  end
end
