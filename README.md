＃ テーブル設計

## users テーブル

| Column             | Type    | Options         |
| ----------         | --------| --------------  |
| nick_name          | string  | null: false     |
| encrypted_password | string  | null: false     |
| last_name          | string  | null: false     |
| name               | string  | null: false     |
| last_name_kana     | string  | null: false     |
| name_kana          | string  | null: false     |
| birth_day          | date    | null: false     |

### Association

- has_many :items
- has_one  :purchase

## items テーブル

| Column                | Type        | Options         |
| ----------            | --------    | --------------  |
| user                  | references  | null: false,  foreign_key: true      |
| item_name             | string      | null: false     |
| item_detail           | text        | null: false     |
| item_category_id      | integer     | null: false     |
| item_status_id        | integer     | null: false     |
| item_delivery_price_id| integer     | null: false     |
| item_delivery_area_id | integer     | null: false     |
| item_delivery_day_id  | integer     | null: false     |
| item_price            | integer     | null: false     |

### Association

- has_one :purchase
- belongs_to :user

## purchases テーブル

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
| purchase                 | references  | null: false,  foreign_key: true |
| delivery_mail_num        | string      | null: false,                    |
| item_delivery_area_id    | integer     | null: false,                    |
| delivery_shikutyouson    | string      | null: false,                    |
| delivery_numbering       | string      | null: false,                    |
| delivery_building_name   | string      |                                 |
| delivery_telephone       | string      | null: false,                    |


### Association

- belongs_to :purchase
