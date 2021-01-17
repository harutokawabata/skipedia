class Public::AnswersController < ApplicationController
  def index
    @answers = Answer.all 
  end
  
  def new
    @answers = Answer.new
    # @answer = Answer.find(params[:id])
    @question = Question.find(params[:question_id])
    # post_image = PostImage.find(params[:post_image_id])
  end

  def create
    # questions= Question.all
    # questions.each do |question|
    #   question.title
    # end
    @answer = Answer.new(answer_params)
    @answer.user_id = current_user.id
    @answer.question_id = answer_params[:question_id]
    # @post.genre_id = post_params[:genre_id]
    # @answer.title = qusetion.title
    # byebug
    if @answer.save!
      if @answer.question.is_active == "f"
        @answer.question.is_active = "t"
        @answer.question.save!
      end
    end
    redirect_to questions_path
  end
  
  def show
    @answer = Answer.find(params[:id])
  end

  def edit
    @answers = Answer.new
    # @answer = Answer.find(params[:id])
    # @question = Question.find(params[id])
  end

  def update
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy!
    redirect_to answers_path
  end
  
  def search
    @answers = Answer.search(params[:search])
    # @answers = Answer.all
  end
  
  private
  def answer_params
    params.permit(:user_id, :question_id, :tag_id, :introduction, :title, :link, :status, :search)
  end
end
