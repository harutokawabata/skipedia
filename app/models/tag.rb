class Tag < ApplicationRecord
    belongs_to :genre
    has_many :posts, dependent: :destroy
    has_many :histories, dependent: :destroy

    has_many :questions, dependent: :destroy
    # validates :genre_id, :name, :introduction, presence: true
end
