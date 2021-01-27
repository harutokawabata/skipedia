class Admins::HistoriesController < ApplicationController
     before_action :authenticate_admin!
  def index
    @answers = Answer.all
    @events = Event.all
    @posts = Post.all
    @questions = Question.all
    @users = User.all
    @event_entries = EventEntry.all
    @tags = Tag.all
    @genres = Genre.all
  end

  def show
  end

  def destroy
  end
end
