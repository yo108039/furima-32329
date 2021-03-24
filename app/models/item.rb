class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_one :order
  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_area
  belongs_to :delivery_price
  belongs_to :delivery_day
  has_one_attached :image

  
  with_options presence: true do
    validates :image
    validates :name
    validates :detail

    with_options format: {with: /\A[0-9]+\z/, message: 'は半角数字を使用してください'},numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 } do
      validates :price
    end

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :delivery_area_id
      validates :delivery_price_id
      validates :delivery_day_id
    end
      
  end

end
