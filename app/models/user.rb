class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         
         validates :password, presence: true,
            format: { with: /\A[a-z\d]{6,100}+\z/i}
         validates :name_family, presence: true,
         format: {
           with: /\A[一-龥ぁ-ん]/}
           validates :name_first, presence: true,
         format: {
           with: /\A[一-龥ぁ-ん]/}
           validates :name_family_kana, presence: true,
         format: {
           with: /[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/}
           validates :name_first_kana, presence: true,
         format: {
           with:/[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/}
           
end
