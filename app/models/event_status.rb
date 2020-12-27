class EventStatus < ApplicationRecord
    enum cancel:{
        donot_entry: 0, #未エントリー
        entry: 1, #エントリー済み
        stop_entry: 2 #キャンセル
    }
    belongs_to :user
    belongs_to :event
end
