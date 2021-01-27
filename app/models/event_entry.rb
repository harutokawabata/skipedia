class EventEntry < ApplicationRecord
    belongs_to :user
    belongs_to :event
    has_many :histories, dependent: :destroy

    
    enum cancel:{
        do_entry: 0, #エントリー済み
        cancel_entry: 1, #キャンセル済み
        donot_entry: 2, #キャンセル
        # canceld: 3, #キャンセル済み
    }
end
