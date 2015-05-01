class UsersController < ApplicationController
  def show
    @user = User.find params[:id]
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes user_params
      flash[:success] = "Cập nhật thông tin cá nhân thành công"
      redirect_to user_path @user
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password,:password_confirmation
  end
end