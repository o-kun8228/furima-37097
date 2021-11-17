class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :nickname, presence: true
  validates :encrypted_password,:password,:password_confirmation,length:{minimum:6},format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/}
  with_options presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/} do
      validates :family_name
      validates :first_name
    end


  with_options presence: true, format: {with: /\A[ァ-ヶー－]+\z/} do
      validates :family_name_zenkaku_katakana
      validates :first_name_zenkaku_katakana
    end

    validates :password, presence: true, format: {with:/\A[a-zA-Z0-9]+\z/}


  validates :birthday, presence: true
end
