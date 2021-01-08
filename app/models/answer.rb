class Answer < ApplicationRecord
    # has_many :posts, dependent: :destroy
    belongs_to :user
    belongs_to :question
end
