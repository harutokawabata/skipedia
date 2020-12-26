class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    # @user = User.find(params[:id])
      @user = current_user
  end

  def edit
    @user = current_user
    # @user = User.find(params[:id])
  end

  def update
    # @user = User.find(params[:id])
    @user = current_user
    @user.update!(user_params)
    redirect_to  users_path
  end
  
  def unsbscribe
    @user = current_user
  end
  
  def withdraw
    @user = current_user
    if @user.update(is_deleted: true)
      reset_session
      flash[:notice] = "今までありがとうございました！"
    else
      flash[:notice] = "error"
    end
    redirect_to root_path
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :watchword, :encrypted_password, :popular, :is_deleted, :email, :password)
  end
  
  # def authenticate_user
  #   unless logged_in?
  #     flash[:error] = "会員登録してください"
  #     redirect_to new_user_registration_path # halts request cycle
  #   end
  # end
end
