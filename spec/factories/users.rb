FactoryBot.define do
  factory :user do
    nick_name               {Faker::Name.initials(number: 2)}
    email                   {Faker::Internet.free_email}
    password                {'1a' + Faker::Internet.password(min_length: 4)}
    password_confirmation   {password}
    last_name                   {'苗字'}
    name                   {'名前'}
    last_name_kana                   {'カナミョウジ'}
    name_kana                   {'カナナマエ'}
    birth_day                   {'19300101'}
  end
end