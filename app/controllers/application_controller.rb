class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private


  def log_ip
    ip = IPAddress.find_by(ip: request.remote_ip)
    if ip == nil
      ip = IPAddress.create(ip: request.remote_ip)
    else
      ip.increment!(:visits)
    end
    ip
  end

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

end
