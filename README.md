＃ テーブル設計

## users テーブル

| Column             | Type    | Options                    |
| ----------         | --------| --------------             |
| nick_name          | string  | null: false                |
| email              | string  | null: false,  unique: true |
| encrypted_password | string  | null: false                |
| last_name          | string  | null: false                |
| name               | string  | null: false                |
| last_name_kana     | string  | null: false                |
| name_kana          | string  | null: false                |
| birth_day          | date    | null: false                |

### Association

- has_many  :items
- has_many  :orders

## items テーブル

| Column                | Type        | Options         |
| ----------            | --------    | --------------  |
| user                  | references  | null: false,  foreign_key: true      |
| name                  | string      | null: false     |
| detail                | text        | null: false     |
| category_id           | integer     | null: false     |
| status_id             | integer     | null: false     |
| delivery_price_id     | integer     | null: false     |
| delivery_area_id      | integer     | null: false     |
| delivery_day_id       | integer     | null: false     |
| price                 | integer     | null: false     |

### Association

- has_one :order
- belongs_to :user

## orders テーブル

| Column                  | Type        | Options                         |
| ----------              | --------    | --------------------------------|
| item                    | references  | null: false,  foreign_key: true |
| user                    | references  | null: false,  foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :delivery


## deliveries テーブル

| Column                   | Type        | Options                         |
| ----------               | --------    | --------------------------------|
| order                   | references  | null: false,  foreign_key: true |
| delivery_mail_num        | string      | null: false,                    |
| delivery_area_id         | integer     | null: false,                    |
| delivery_shikutyouson    | string      | null: false,                    |
| delivery_numbering       | string      | null: false,                    |
| delivery_building_name   | string      |                                 |
| delivery_telephone       | string      | null: false,                    |


### Association

- belongs_to :order
