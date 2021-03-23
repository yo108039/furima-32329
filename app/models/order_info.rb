class OrderInfo
  include ActiveModel::Model
  attr_accessor :token, :item_id, :user_id, :credit_info, :credit_month, :credit_year, :credit_cvc,:delivery_mail_num, :delivery_area_id, :delivery_shikutyouson, :delivery_numbering, :delivery_building_name, :delivery_telephone

  with_options presence: true do

    validates :token
    validates :item_id
    validates :user_id
    
    with_options format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'はハイフンを使用してください'}   do
      validates :delivery_mail_num
    end

    with_options numericality: { other_than: 1 } do
      validates :delivery_area_id
    end

    validates :delivery_shikutyouson
    validates :delivery_numbering

    with_options format: {with: /\A[0-9]{1,11}\z/, message: 'は11桁以内数字を使用してください'}   do
      validates :delivery_telephone
    end


  end


  def save
    order = Order.create(item_id: item_id, user_id: user_id )
    Delivery.create(order_id: order.id,delivery_mail_num: delivery_mail_num, delivery_area_id: delivery_area_id, delivery_shikutyouson: delivery_shikutyouson, delivery_numbering: delivery_numbering, delivery_building_name: delivery_building_name, delivery_telephone: delivery_telephone)
  end

end