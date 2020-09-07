class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :comments
  has_many :items
         
  validates :nickname,:first_name,:family_name,:first_name_kana,:family_name_kana,:birthday, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, length: { minimum: 6 }, format: { with: /(?=.*\d+.*)(?=.*[a-zA-Z]+.*)./ }
  validates :password_confirmation, presence: true, length: { minimum: 6 }, format: { with: /(?=.*\d+.*)(?=.*[a-zA-Z]+.*)./ }
  
end

