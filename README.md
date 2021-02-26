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
| name     | string | null: false |
| info     | text   |null: false  |
| user 　　 | references | foreign_key: true |
| price    | integer| null: false |
| item_status_id| integer |null: false  |
| delivary_id | integer | null: false |
| prefectures_id| integer| null: false |
| day_time_id | integer| null: false|
| delivary_price_id | integer | null: false|
### Association

- has_many :comments
- has_one :buy
- belongs_to :user


##商品購入テーブル(orders)
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| user     | references | foreign_key: true |
| item     | references  |foreign_key: true  |

### Association

- 
- belongs_to :user
- belongs_to :item
- has_one   :history

##comment

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| content  | text   | null: false |
| user_id  | references  | foreign_key: true |
| room     | references  |foreign_key: true  |

### Association

- belongs_to :item
- belongs_to :user

##購入者情報テーブル(addresses)

| Column          | Type     | Options     |
| --------        | ------   | ----------- |
| prefectures_id  | integer  | null: false | #都道府県#
| streetadores    | string   | null: false | #住所#
| postalcode      | string   | null: false | #郵便番号#
| cities          | string   | null: false | #市町村#
| buildname       | string   | null        | #建物の名前#
| phonenamber     | string   | null: false | #電話番号#
| order           | references  | foreign_key: true |

-  belongs_to :buy


