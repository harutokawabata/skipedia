class Answer < ApplicationRecord
    # has_many :posts, dependent: :destroy
    belongs_to :user
    belongs_to :question
    validates :introduction, presence: true

    
    def self.search(search)
        if search
            # p 'search'
            self.joins(:question).where("questions.title LIKE?", "%#{search}%")
        else
            self.all
        end
    end
end
