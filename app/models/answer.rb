class Answer < ApplicationRecord
    # has_many :posts, dependent: :destroy
    belongs_to :user
    belongs_to :question
    
    def self.search(search)
        if search
            Question.where(['title LIKE?', "%#{search}%"])
        else
            Question.all
        end
    end
end
