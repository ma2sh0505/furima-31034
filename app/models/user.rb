class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :items

       with_options presence: true do

         validates :nickname
         validates :family_name,format: {with: /\A[ぁ-んァ-ン一-龥]+\z/}
         validates :first_name,format:{with: /\A[ぁーんァ-ン一-龥]+\z/}
         validates :family_name_kana,format:{with: /\A[ァ-ン]+\z/}
         validates :first_name_kana,format:{with: /\A[ァ-ン]+\z/}
         validates :birth_day
         validates :password,format:{with:/[a-z\d]/i}
       end
end
