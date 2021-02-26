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
- has_many :history



##商品出品機能テーブル(items)

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string   | null: false |
| info     | text   |null: false  |
| user | reference | foreign_key: true |
| price    | integer| null: false |
| item_status_id| integer |null: false  |
| delivary_id | integer | null: false |
| area_id     | integer| null: false |
| day_time_id | integer| null: false|
| delivary_price_id | integer | null: false|
### Association

- has_many :comments
- has_one :buys
- belongs_to :user


##商品購入テーブル(buys)
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| user_id | references | foreign_key: true |
| item_id | references  |foreign_key: true  |

### Association

- 
- belongs_to :user
- belongs_to :item

##comment

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| content  | text   | null: false |
| user_id  | references  | foreign_key: true |
| room     | references  |foreign_key: true  |

### Association

- belongs_to :item
- belongs_to :user

##購入者情報テーブル(history)

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| user_id  | reference | foreign_key: true |
| streetadores_id | integer   | null: false |
| postalcode_id | integer   | null: false |
| cities_id   | text   | null: false |
| buildname | text   | null: true |
| phonenamber | text   | null: false |

- belongs_to :user
- 
