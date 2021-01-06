class Question < ApplicationRecord
    belongs_to :tag, dependent: :destroy, optional: true
    # belongs_to :genre, dependent: :destroy, optional: true
    belongs_to :post, dependent: :destroy, optional: true
    # optional: trueは外部キーのnilを許可する,これがないとエラーになる

    # belongs_to :genres, dependent: :destroy
end
