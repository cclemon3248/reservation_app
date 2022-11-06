class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :set_q
  before_action :header_image
  before_action :login_required
  skip_before_action :login_required, only: [:top]

  def top
  end

  private

  def login_required
    redirect_to new_session_path unless current_user
  end

  def set_q
    @q = Room.ransack(params[:q])
  end

  def header_image
    @image = User.find(current_user.id) if logged_in?
  end
end
