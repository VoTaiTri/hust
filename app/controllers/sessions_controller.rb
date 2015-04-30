class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password])
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        flash[:success] = "Đăng nhập thành công"
        redirect_back_or root_path
    else
        flash.now[:danger] = "Email hoặc mật khẩu nhập vào không đúng"
        render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = "Đã đăng xuất khỏi hệ thống"
    redirect_to root_url
  end
end