class Admins::EventsController < ApplicationController
    
    def index
        @events = Event.all
    end
    
    def new
        @event = Event.new
    end
    
    def create
        @event = Event.new(event_params)
        # @event.event_entries = event_entry.cancel
        if @event.save!
            # flash[:notice] = "イベントの追加に成功しました"
            redirect_to admins_events_path
        else
            flash[:notice] = "error"
            redirect_to admins_events_path
        end
    end
    
    def edit
        @event = Event.find(params[:id])
    end
    
    def update
        @event = Event.find(params[:id])
        if @event.update(event_params)
            flash[:notice] = "編集に成功しました"
            redirect_to admins_events_path
        else
            flash[:notice] = "error"
            redirect_to admins_events_path
        end
    end
    
    def destroy
        @event = Event.find(params[:id])
        if @event.destroy
            flash[:notice] = "イベントの削除に成功しました"
            redirect_to admins_events_path
        else
            flash[:notice] = "error"
            redirect_to admins_events_path
        end
        
    end
    
    def show
        @event = Event.find(params[:id])
    end
    
    private
    def event_params
        params[:cancel] = 0
        params.require(:event).permit(:event_entries, :name, :date, :start, :finish, :entry_fee, :organizer, :event_detail, :event_status, :capacity, :cancel, :customer_id)
    end
end
