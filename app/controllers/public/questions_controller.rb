class Public::QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end
  
  def show
    @question = Question.find(params[:id])
    @question_answer = Question.new
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
  end
  
  private
  def question_params
    params.require(:question).permit(:tag_id, :genre_id, :name, :title, :introduction, :link, :is_active)
  end
end
