class Post < ApplicationRecord
    belongs_to :genre
    belongs_to :user
    belongs_to :tag
    
end