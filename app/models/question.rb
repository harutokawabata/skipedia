class Question < ApplicationRecord
    belongs_to :tag, dependent: :destroy, optional: true
    belongs_to :post, dependent: :destroy

    # belongs_to :genres, dependent: :destroy
end
