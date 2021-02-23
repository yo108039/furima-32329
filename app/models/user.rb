class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

  with_options presence: true do
    
    validates :nick_name
    validates :birth_day

    with_options format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'は全角文字を使用してください'} do
      validates :last_name
      validates :name
    end

    with_options format: {with: /\A[ァ-ヶ]+\z/, message: 'は全角カナを使用してください'} do
      validates :last_name_kana 
      validates :name_kana
    end

  end

  has_many :items
  has_many :purchases

end
