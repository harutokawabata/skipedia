class Public::HomesController < ApplicationController
    def top
        @questions = Question.all
        @events = Event.all
    end
end
