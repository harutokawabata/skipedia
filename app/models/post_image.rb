class PostImage < ApplicationRecord
    belongs_to :admin
    has_many :events, dependent: :destroy
    attachment :image
end
