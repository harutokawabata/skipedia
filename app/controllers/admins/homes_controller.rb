class Admins::HomesController < ApplicationController
    
 def top
 end
 
 def index
  @posts = Post.all
  @questions = Question.all
  @events = Event.all
 end
 
end
