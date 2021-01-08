class Question < ApplicationRecord
    belongs_to :tag, optional: true
    #belongs_to :tag, dependent: :destroyだとえらーになるからdependent: :destroyを取り除いた
    # belongs_to :genre, dependent: :destroy, optional: true
    belongs_to :post, dependent: :destroy, optional: true
    # optional: trueは外部キーのnilを許可する,これがないとエラーになる
    has_many :answers, dependent: :destroy
    belongs_to :user
    # optional: true

    # belongs_to :genres, dependent: :destroy
end