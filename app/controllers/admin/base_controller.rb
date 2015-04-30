class Admin::BaseController < ActionController::Base
  before_action :authorized_admin?

  layout 'application'
  include SessionsHelper

  private
  def authorized_admin?
    unless logged_in_admin?
      flash[:danger] = "Bạn không đủ quyền hạn để xem trang này."
      redirect_to root_path
    end
  end
end