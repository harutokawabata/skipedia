class User < ApplicationRecord
  # belongs_to :user
  has_many :posts, dependent: :destroy
  has_many :event_entries, dependent: :destroy
  has_many :events,through: :event_entries
  has_many :answers, dependent: :destroy
  has_many :questions, dependent: :destroy
  
  # has_many :events, dependent: :destroy

  #したの記載はnameでログインする時に記載
  # validates :name, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 
  #したの記載はnameでログインする時にコメントアウト外す
    # def email_required?
    #   false
    # end
    # def email_changed?
    #   false
  def active_for_authentication?
    super && (self.is_deleted == false)
  end

end
