class History < ApplicationRecord
    belongs_to :answer
    belongs_to :event
    belongs_to :post
    belongs_to :question
    belongs_to :user
    belongs_to :event_entry
    belongs_to :tag
end
