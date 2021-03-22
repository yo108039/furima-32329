FactoryBot.define do
  factory :order_info do
    credit_info       {"4242424242424242"}
    credit_cvc       {"123"}
    credit_month       {"12"}
    credit_year       {"90"}
    token             {"tok_abcdefghijk00000000000000000"}


    
    delivery_mail_num       {"123-4567"}
    delivery_area_id       {"2"}
    delivery_shikutyouson       {"東京都"}
    delivery_numbering       {"練馬区1-1-1"}
    delivery_building_name       {"テストビル"}
    delivery_telephone       {"09012345678"}

  end
end
