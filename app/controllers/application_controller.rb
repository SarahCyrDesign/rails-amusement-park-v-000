
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :logged_in?, :current_user
  before_action :current_user
  before_action :check_if_logged_in, except: [:new, :create, :home]


  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def check_if_logged_in
    redirect_to root_path unless logged_in?
  end
end
