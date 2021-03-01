class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         with_options presence: true do
         validates :password, 
            format: { with: /\A[a-z\d]{6,100}+\z/i}
         validates :name_family,
         format: {
           with: /\A[一-龥ぁ-ん]/}
           validates :name_first,
         format: {
           with: /\A[一-龥ぁ-ん]/}
           validates :name_family_kana,
         format: {
           with: /[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/}
           validates :name_first_kana,
         format: {
           with:/[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/}
           validates :birthday
           validates :name
           }
         end
end
