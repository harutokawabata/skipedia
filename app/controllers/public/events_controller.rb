class Public::EventsController < ApplicationController
  def index
    #@events = Event.left_joins(:event_entries).select("events.*", "event_entries.cancel")
    @events = Event.all
    # A = @event.capacity
    # B = @event.event_entries.count 
    # @acceptable = a - b

    # @events = []
    # @events_all.each do | event,index |
    #   if event.event_entries.present?
    #     if event.event_entries.include?(current_user.id)
    #       @events << event
    #     end
    #     next
    #   end
    #   @events << event
    # end
        
    #my_event_ids = EventEntry.where(user_id: current_user.id).pluck('event_id')
    #cancel_event_ids = EventEntry.where(cancel: 0).pluck('event_id')
    #@events = Event.left_joins(:event_entries).where('event_entries.id', my_event_ids + cancel_event_ids).select("events.*", "event_entries.cancel")
    #@events = Event.all
    #@entry = EventEntry.find_by(user_id: current_user.id)
    # , event_id: @event.id)
  end

  def show
    @event = Event.find(params[:id])
    @event_entries = EventEntry.all
    @ec = @event.capacity
    # if @event.event_entries.cancel == cancel_entry
    @eeec =  @event.event_entries.where(cancel: 'do_entry').count
      # @eeec = @event.event_entries.cancel.do_entry.count 
    @acceptable = @ec - @eeec
    if user_signed_in?
       @entry = EventEntry.find_by(user_id: current_user.id, event_id: @event.id)
    end
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
      if entry.save
        flash[:notice] = "お申し込みが完了しました！"
        redirect_to events_withdraw_path(entry.id)
      end
      # if entry.cancel == "do_entry" #0:エントリー済み(35行目と同じ意味)
      # if entry.do_entry?
      #   # entry.update(cancel: "cancel_entry") # 2 = キャンセルする(37行目と同じ意味)
      #   entry.cancel_entry! # 2 = キャンセルする
      # end
    end
    
   a = @event.capacity
   b = @event.event_entries.count 
   acceptable = a - b
   acceptable
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
