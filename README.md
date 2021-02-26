# テーブル設計


##users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | unique: true ,null: false|
| encrypted_password| string | null: false |
| name_first| string| null: false |
| name_last | string| null: false |
| name_fist_kana| string | null: false |
| name_last_kana| string | null: false |
| birthday | date   | null: false |
### Association

- has_many :items
- has_many :buys
- has_many :comments



##商品出品機能テーブル(items)

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | text   | null: false |
| info| text   |null: false  　　　|
| saler_id | string | foreign_key: true |
| price    | integer| null: false |
| item_status| text |null: false  |
| delivary_id | integer | null: false |
| area_id     | integer| null: false |
| day_time_id | integer| null: false|
| delivary_price_id | integer | null: false|
### Association

- has_many :comments
- has_many :buys
- has_many :users


##商品購入テーブル(buys)
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| buyer | references | foreign_key: true |
| product  | references  |foreign_key: true  |

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
| streetadores | text   | null: false |