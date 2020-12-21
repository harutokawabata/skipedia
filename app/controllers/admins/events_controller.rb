class Admins::EventsController < ApplicationController
    
    def index
        @events = Event.all
    end
    
    def new
        @event = Event.new
    end
    
    def create
        @event = Event.new(event_params)
        if @event.save
            flash[:notice] = "イベントの追加に成功しました"
            redirect_to admins_events_path
        else
            flash[:notice] = "error"
            redirect_to admins_events_path
        end
    end
    
    def edit
    end
    
    def update
    end
    
    def destroy
    end
    
    private
    def event_params
        params.require(:event).permit(:name, :date, :start, :finish, :entry_fee, :organizer, :event_detail, :evemt_status, :capacity, :cancel, :customer_id)
    end
end
