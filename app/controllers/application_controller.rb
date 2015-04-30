class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper

  private
  def authorized_user?
    unless logged_in?
      store_location
      flash[:danger] = "Bạn cần đăng nhập để sử dụng hệ thống."
      redirect_to login_url
    end
  end
end