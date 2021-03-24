FactoryBot.define do
  factory :order_info do
    token             {"tok_abcdefghijk00000000000000000"}
    
    delivery_mail_num       {"123-4567"}
    delivery_area_id       {2}
    delivery_shikutyouson       {"東京都"}
    delivery_numbering       {"練馬区1-1-1"}
    delivery_building_name       {"テストビル"}
    delivery_telephone       {"09012345678"}

  end
end
