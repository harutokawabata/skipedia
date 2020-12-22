class Genre < ApplicationRecord
    has_many :tags, dependent: :destroy
    validates :name, :introduction, presence: true
end
