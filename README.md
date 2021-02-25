# テーブル設計


##users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| nickname | string |null: false  |
| 住所      | string | null: false |
| user_info| string | null: false |

### Association

- has_many :items
- has_many :buys
- has_many :comments



##商品出品機能テーブル(items)

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| item     | text   | null: false |
| items_id | text   | null: false |
| image    | text   | null: false |
| item_info| text   |null: false  |
| saler_id | string | null: false |
| price    | text   | null: false |

### Association

- has_many :comments
- has_many :buys
- has_many :users


##商品購入テーブル(buys)
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| buyer_id | string | null: false |

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