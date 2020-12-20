class User < ApplicationRecord
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
    # end

end
