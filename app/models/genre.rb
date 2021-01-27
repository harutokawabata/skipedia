class Genre < ApplicationRecord
    has_many :tags, dependent: :destroy
    has_many :posts, dependent: :destroy
    has_many :histories 

    # has_many :questions, dependent: :destroy
    validates :name, :introduction, presence: true
end
