class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @users = User.all
  end

  def show
    @users = User.all
    @user = User.find(params[:id])
    @user_ee = @user.event_entries
    @user_events = @user.events
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
  
  def update
    @user.update(user_params)
    redirect_to admins_users_path
  end
  
  def withdraw
    @user = User.find(params[:id])
    if @user.update(is_deleted: false)
      flash[:notice] = "会員復活"
      redirect_to admins_users_path
    else
      flash[:notice] = "error"
      redirect_to admins_users_path
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :watchword, :encrypted_password, :popular, :is_deleted)
  end
end
