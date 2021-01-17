class Public::QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end
  
  def show
    @question = Question.find(params[:id])
    @question_answer = Question.new
    # @answer = Answer.find(params[:id])
  end

  def edit
  end

  def new
    @question = Question.new
    @genres = Genre.all
    @tags = Tag.all
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    # @question.is_active = true
    @question.save!
    redirect_to questions_path
    #   flash[:notice] = "投稿に成功しました"
    #   redirect_to questions_path
    # else
    #   flash[:notice] = "error"
    #   redirect_to questions_path
    # end
  end

  def update
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy!
    redirect_to questions_path
  end
  
  def search
     @questions = Question.search(params[:search])
  end
  
  
  private
  def question_params
    params.require(:question).permit(:tag_id, :genre_id, :user_id, :name, :title, :introduction, :link, :is_active, :search)
  end
end
