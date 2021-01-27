class Admins::HomesController < ApplicationController
 before_action :authenticate_admin!    
 def top
  @posts = Post.all
  @questions = Question.all
  @answers = Answer.all
  @events = Event.all
 end
 
 def index
  @posts = Post.all
  @questions = Question.all
  @events = Event.all
 end
 
end
