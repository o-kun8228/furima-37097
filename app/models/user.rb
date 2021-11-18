class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :nickname, presence: true
  validates :password,format:{with:/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  with_options presence: true, format: {with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/} do
      validates :family_name
      validates :first_name
    end


  with_options presence: true, format: {with: /\A[ァ-ヶー－]+\z/} do
      validates :family_name_zenkaku_katakana
      validates :first_name_zenkaku_katakana
    end


  validates :birthday, presence: true
end
