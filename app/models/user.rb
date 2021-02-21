class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nick_name, presence: true
  validates :last_name, presence: true
  validates :name, presence: true
  validates :last_name_kana, presence: true
  validates :name_kana, presence: true
  validates :birth_day, presence: true

  has_many :items
  has_many :purchases

end
