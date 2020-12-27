class Public::EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def confirm
    # byebug
   #event.event_statuses.build(user_id:current_user.id)
   #event.save
   #result = event.event_statuses.find_by(user_id: current_user.id)
   event = Event.find(params[:id])
   result = EventStatus.find_or_create_by(user_id:current_user.id,event_id:event.id)
   if result.donot_entry?
    result.update(cancel: 1)
    redirect_to events_path
   elsif result.entry?
    result.update(cancel: 2)
     redirect_to  events_path
   elsif result.stop_entry?
    result.update(cancel: 0)
     redirect_to  events_path
   end
    # redirect_to event s_path
  end

  def withdraw
    
  end

  def cancel
  end
  
  # private
  # def event_params
  #   params.require(:event).permit(:cancel)
  # end
end
