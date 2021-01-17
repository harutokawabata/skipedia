class Post < ApplicationRecord
    belongs_to :genre, optional: true
    has_many :histories, dependent: :destroy
    belongs_to :user
    belongs_to :tag
    # belongs_to :answer, optional: true
    
    def self.search(search)
        if search
            Post.where(['title LIKE ?', "%#{search}%"])
        else
            Post.all
        end
    end    
end
