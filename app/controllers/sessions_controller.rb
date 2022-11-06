class SessionsController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # ログイン成功した場合
      session[:user_id] = user.id
      flash[:notice] = "Signed in successfully."
      redirect_to root_path
    else
      # ログイン失敗した場合
      flash.now[:danger] = 'Invalid Email or password.'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = 'Signed out successfully.'
    redirect_to root_path
  end
end
