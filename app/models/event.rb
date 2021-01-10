class Event < ApplicationRecord

    has_many :event_entries, dependent: :destroy
    has_many :users,through: :event_entries
    
    enum event_status:{
        perparation: 0, #準備中
        waiting: 1, #受付中
        finish: 2, #受付終了
    }
    # belongs_to :user
    validates :date, :start, :finish, :entry_fee, :organizer, :event_detail, :capacity, :name, presence: true
end
