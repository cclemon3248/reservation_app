class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :login_required
  before_action :set_q

  def top
  end

  private

  def login_required
    redirect_to new_session_path unless current_user
  end

  def set_q
    @q = Room.ransack(params[:q])
  end
end
