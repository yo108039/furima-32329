＃ テーブル設計

## users テーブル

| Column             | Type    | Options         |
| ----------         | --------| --------------  |
| nick_name          | string  | null: false     |
| password           | string  | null: false     |
| encrypted_password | string  | null: false     |
| last_name          | string  | null: false     |
| name               | string  | null: false     |
| last_name_kana     | string  | null: false     |
| name_kana          | string  | null: false     |
| birth_day          | date    | null: false     |

### Association

- has_many :items

## items テーブル

| Column                | Type        | Options         |
| ----------            | --------    | --------------  |
| user                  | references  | null: false,  foreign_key: true      |
| item_name             | text        | null: false     |
| item_detail           | text        | null: false     |
| item_category_id      | int         | null: false     |
| item_status_id        | int         | null: false     |
| item_delivery_price_id| int         | null: false     |
| item_delivery_area_id | int         | null: false     |
| item_delivery_day_id  | int         | null: false     |
| item_price            | int         | null: false     |

### Association

- has_one :purchase
- belongs_to :user

## purchase テーブル

| Column                  | Type        | Options                         |
| ----------              | --------    | --------------------------------|
| item                    | references  | null: false,  foreign_key: true |
| user                    | references  | null: false,  foreign_key: true |
| credit_num              | int         | null: false                     |
| credit_effective_month  | string      | null: false                     |
| credit_effective_year   | string      | null: false                     |
| credit_effective_num    | string      | null: false                     |

### Association

- belongs_to :user
- belongs_to :item

## delivery テーブル

| Column                   | Type        | Options                         |
| ----------               | --------    | --------------------------------|
| purchase                 | references  | null: false,  foreign_key: true |
| delivery_mail_num        | string      | null: false,                    |
| tem_delivery_area_id     | int         | null: false,                    |
| delivery_shikutyouson    | string      | null: false,                    |
| delivery_numbering       | string      | null: false,                    |
| delivery_building_name   | string      | null: false,                    |
| delivery_telephone       | String      | null: false,                    |


### Association

- belongs_to :purchase
