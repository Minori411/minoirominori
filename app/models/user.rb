class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable, :confirmable

VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i

validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
validates :password, presence: true, length: { minimum: 8 }, format: { with: VALID_PASSWORD_REGEX}

end