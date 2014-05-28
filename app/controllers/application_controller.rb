class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from Exception, with: :record_error_log

  private
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
    @current_user ||= guest_user
  end

  def guest_user
    User.find_by_id(0) || User.create!(id: 0)
  end

  def record_error_log(e = nil)
    logger.warn(e.message)
    raise
  end
end
