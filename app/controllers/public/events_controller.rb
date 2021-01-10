class Public::EventsController < ApplicationController
  def index
    @events = Event.left_joins(:event_entries).select("events.*", "event_entries.cancel")
    #@events = Event.all
    #@entry = EventEntry.find_by(user_id: current_user.id)
    # , event_id: @event.id)
  end

  def show
    @event = Event.find(params[:id])
    @event_entries = EventEntry.all
    @entry = EventEntry.find_by(user_id: current_user.id, event_id: @event.id)
    # if @event_entry.cancel == "donot_entry"
    #   @entry = EventEntry.find_by(user_id: current_user.id)
    # else
    #   @entry = EventEntry.find_by(user_id: current_user.id, event_id: @event.id)
    # end
  end

  def confirm
    # byebug
    #event.event_statuses.build(user_id:current_user.id)
    #event.save
    #result = event.event_statuses.find_by(user_id: current_user.id)
    @event = Event.find(params[:id])
    entry = EventEntry.find_by(user_id: current_user.id, event_id: @event.id)
    if entry == nil
      entry = EventEntry.new()
      entry.user_id = current_user.id
      entry.event_id = @event.id
      entry.cancel = "do_entry" #0:エントリー済み
      entry.save
      redirect_to events_withdraw_path(entry.id)
      # if entry.cancel == "do_entry" #0:エントリー済み(35行目と同じ意味)
      # if entry.do_entry?
      #   # entry.update(cancel: "cancel_entry") # 2 = キャンセルする(37行目と同じ意味)
      #   entry.cancel_entry! # 2 = キャンセルする
      # end
    end
#    result = EventStatus.find_or_create_by(user_id:current_user.id,event_id:event.id)
#    if result.donot_entry?
#    result.update(cancel: 1)
    # redirect_to events_withdraw_path(entry.id)
    # redirect_to event s_path
  end

  def withdraw
    #@event = Event.find(params[:id])
    #@entry = EventEntry.find_by(user_id: current_user.id, event_id: @event.id)
    
    #########
    @entry = EventEntry.find(params[:id])
    @event = Event.find(@entry.event_id)
    
  end

  def cancel
    event = Event.find(params[:id])
    entry = EventEntry.find_by(user_id: current_user.id, event_id: event.id)
      if entry.do_entry?
        # entry.update(cancel: "cancel_entry") # 2 = キャンセルする(37行目と同じ意味)
        entry.cancel_entry! # 2 = キャンセルする
      end
    redirect_to events_withdraw_path(entry.id)
  end
  
  # private
  # def event_params
  #   params.require(:event).permit(:cancel)
  # end
end
