# テーブル設計


##users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | uniqe: true |
| encrypted_password | string | null: false |
| name_first| string | null: false |
| name_last | string | null: false |
| name_fist_kana| string | null: false |
| name_last_kana| string | null: false |

### Association

- has_many :items
- has_many :buys
- has_many :comments



##商品出品機能テーブル(items)

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| item_name     | text   | null: false |
| item_info| text   |null: false  |
| saler_id | string | null: false |
| price    | integer| null: false |
| item_status| text   |null: false  |
| delivary | integer | delivary_id |
| area     | integer| area_id |
| day_time | integer| date_time_id|
| delivary_price | integer | delivary_price_id |
### Association

- has_many :comments
- has_many :buys
- has_many :users


##商品購入テーブル(buys)
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| buyer_id | references | foreign_key: true |
| room     | references  |foreign_key: true  |

### Association

- belongs_to :comments
- belongs_to :user
- belongs_to :items

##comment

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| content  | text   | null: false |
| user     | string | null: false |
| room     | references  |null: false  |

### Association

- belongs_to :items
- belongs_to :user

##購入者情報テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| item     | text   | null: false |
| items_id | text   | null: false |
| image    | text   | null: false |
| item_info| text   |null: false  |
| saler_id | string | null: false |
| price    | text   | null: false |