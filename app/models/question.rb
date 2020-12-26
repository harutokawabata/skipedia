class Question < ApplicationRecord
    belongs_to :tags, dependent: :destroy, optional: true
    # belongs_to :genres, dependent: :destroy
end
