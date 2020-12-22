class Tag < ApplicationRecord
    belongs_to :genre
    validates :genre_id, :name, :introduction, presence: true
end
