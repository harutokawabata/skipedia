class Post < ApplicationRecord
    belongs_to :genre
    belongs_to :user
    belongs_to :tag
    # belongs_to :answer, optional: true
    
end
