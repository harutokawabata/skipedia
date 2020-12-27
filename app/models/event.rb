class Event < ApplicationRecord

    has_many :event_statuses, dependent: :destroy
    has_many :users,through: :event_statuses
    
    # belongs_to :user
    validates :date, :start, :finish, :entry_fee, :organizer, :event_detail, :capacity, :name, presence: true
end
