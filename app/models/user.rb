class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, uniqueness: true
  has_many :products
  has_many :comments
  has_many :product_purchases

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }

  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i.freeze
  validates :password, presence: true, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }

  validates :first_name, format: {
    with: /\A[^ -~｡-ﾟ]+\z/
  }, presence: true

  validates :family_name, format: {
    with: /\A[^ -~｡-ﾟ]+\z/
  }, presence: true

  validates :first_name_kana, format: {
    with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/
  }, presence: true

  validates :family_name_kana, format: {
    with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/
  }, presence: true

  validates :birthday, presence: true
end
