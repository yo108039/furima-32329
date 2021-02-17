＃ テーブル設計

## users テーブル

| Column           | Type    | Options         |
| ----------       | --------| --------------  |
| user_id          | string  | null: false     |
| nick_name        | string  | null: false     |
| password         | string  | null: false     |
| psssword_confirm | string  | null: false     |
| last_name        | string  | null: false     |
| name             | string  | null: false     |
| last_name_kana   | string  | null: false     |
| name_kana        | string  | null: false     |
| birth_year       | int     | null: false     |
| birth_month      | int     | null: false     |
| birth_day        | int     | null: false     |

### Association

- has_many :items

## items テーブル

| Column             | Type        | Options         |
| ----------         | --------    | --------------  |
| item_id            | string      | null: false     |
| user_id            | references  | null: false,  foreign_key: true      |
| item_text          | string      | null: false     |
| item_category      | string      | null: false     |
| item_status        | string      | null: false     |
| item_delivery_price| int         | null: false     |
| item_delivery_area | string      | null: false     |
| item_delivery_day  | string      | null: false     |
| item_price         | int         | null: false     |

### Association

- has_one :purchase
- belongs_to :users

## purchase テーブル

| Column                  | Type        | Options                         |
| ----------              | --------    | --------------------------------|
| purchase_user_id        | string      | null: false                     |
| item_id                 | references  | null: false,  foreign_key: true |
| user_id                 | references  | null: false,  foreign_key: true |
| credit_num              | int         | null: false                     |
| credit_effective_month  | string      | null: false                     |
| credit_effective_year   | string      | null: false                     |
| credit_effective_num    | string      | null: false                     |

### Association

- has_one :item
- has_one :delivery

## delivery テーブル

| Column                   | Type        | Options                         |
| ----------               | --------    | --------------------------------|
| purchase_user_id         | string      | null: false,  foreign_key: true |
| delivery_mail_num        | string      | null: false,                    |
| delivery_prefectures     | string      | null: false,                    |
| delivery_shikutyouson    | string      | null: false,                    |
| delivery_building_name   | references  | null: false,                    |
| delivery_telephone       | int         | null: false,                    |


### Association

- belongs_to :purchase
