class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from Exception, with: :record_error_log

  private
  def record_error_log(e = nil)
    logger.warn(e.message)
    raise
  end
end
