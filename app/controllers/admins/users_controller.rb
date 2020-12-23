class Admins::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @users = User.all
    @user = User.find(params[:id])
  end
  
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = 'BANしました！'
    else
      flash[:notice] = 'error'
    end
    redirect_to admins_users_path
  end
  
  def confirm
    @user = User.find(params[:id])
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :watchword, :encrypted_password, :popular, :is_deleted)
  end
end
