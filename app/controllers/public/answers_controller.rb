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
    @answer.save!
    redirect_to answers_path
  end

  def edit
  end

  def update
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy!
    redirect_to answers_path
  end
  
  private
  def answer_params
    params.permit(:user_id, :question_id, :tag_id, :introduction, :title, :link, :status)
  end
end
