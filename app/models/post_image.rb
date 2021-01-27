class PostImage < ApplicationRecord
    belongs_to :admin
    has_many :events, dependent: :destroy
    has_many :histories, dependent: :destroy
    attachment :image
end
