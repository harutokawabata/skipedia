class Event < ApplicationRecord
    validates :date, :start, :finish, :entry_fee, :organizer, :event_detail, :capacity, :name, presence: true
end
