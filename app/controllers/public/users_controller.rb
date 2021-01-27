class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    # @user = User.find(params[:id])
      @user = current_user
      @events = current_user.event_entries
  end

  def edit
    @user = current_user
    # @user = User.find(params[:id])
  end

  def update
    # @user = User.find(params[:id])
    @user = current_user
    if @user.update!(user_params)
      flash[:notice] = '編集に成功しました'
    else
      flash[:notice] = 'error'
    end
    redirect_to  users_path
  end
  
  def unsbscribe
    @user = current_user
  end
  
  def withdraw
    @events = current_user.events
    @user = current_user
    if @user.update(is_deleted: true)
      @events.destroy_all
      reset_session
      flash[:notice] = "今までありがとうございました！"
    else
      flash[:notice] = "error"
    end
    redirect_to root_path
  end
  
  def history_question
    @user = current_user
    @questions = Question.where(user_id: current_user.id).order(created_at: "desc")
  end
  
  def history_post
    @user = current_user
    @posts = Post.where(user_id: current_user.id).order(created_at: "desc")
  end
  
  def history_answer
    @user = current_user
    @answers = Answer.where(user_id: current_user.id).order(created_at: "desc")
  end
  
  def history_return_answer
    @user = current_user
    @answers = Answer.all
    @questions = current_user.questions.order(created_at: :desc)
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
