class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
  validates :nick_name, presence: true  
  validates :last_name, presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'は全角文字を使用してください'}
  validates :name, presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'は全角文字を使用してください'}

  validates :last_name_kana, presence: true, format: {with: /\A[ァ-ヶ]+\z/, message: 'は全角カナを使用してください'}
  validates :name_kana, presence: true,  format: {with: /\A[ァ-ヶ]+\z/, message: 'は全角カナを使用してください'}
  validates :birth_day, presence: true

  has_many :items
  has_many :purchases

end
