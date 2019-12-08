class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  helper_method :current_user
  helper_method :logged_in?
  before_action :login_required

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def login_required
    redirect_to new_session_path unless current_user
  end
end
