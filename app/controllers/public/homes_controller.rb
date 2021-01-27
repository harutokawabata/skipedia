class Public::HomesController < ApplicationController
    def top
        @questions = Question.order(created_at: :desc).all
        @events = Event.all
    end
end
