class UsersController < ApplicationController
  skip_before_action :login_required, only: [:index, :new, :create]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome! You have signed up successfully."
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    password = params[:user][:current_password]
    if @user.authenticate(password)
      @user.current_password = current_user.password_digest
      @user.update(user_params)
      @user.current_password = nil
      flash[:notice] = "ユーザーIDが「#{@user.id}」の情報を更新しました"
      redirect_to user_path(@user.id)
    else
      @user.current_password = nil
      @user.update(user_params)
      render :edit
    end
  end
  
  def profile
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to user_profile_path(current_user.id)
    end
  end

  def profile_update
    @user = User.find_by(id: params[:id])
    @user.current_password = current_user.password_digest
    if @user.update(profile_params)
      @user.current_password = nil
      flash[:notice] = "Profile was successfully updated."
      redirect_to user_profile_path(@user.id)
    else
      @user.current_password = nil
      render :profile
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :content)
  end

  def profile_params
    params.require(:profile).permit(:email, :name, :image, :content)
  end
end