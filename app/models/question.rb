class Question < ApplicationRecord
    belongs_to :tag, optional: true
    #belongs_to :tag, dependent: :destroyだとえらーになるからdependent: :destroyを取り除いた
    # belongs_to :genre, dependent: :destroy, optional: true
    belongs_to :post, dependent: :destroy, optional: true
    # optional: trueは外部キーのnilを許可する,これがないとエラーになる
    has_many :answers, dependent: :destroy
    belongs_to :user
    has_many :histories, dependent: :destroy
    validates :title, :introduction, :tag_id, presence: true
    
    def self.search(search)
        if search
          Question.where(['title LIKE ?', "%#{search}%"])
        else
          Question.all
        end
    end

    # optional: true

    # belongs_to :genres, dependent: :destroy
end