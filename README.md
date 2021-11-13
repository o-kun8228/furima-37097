users

|Column                      |Type  |Options                            |
|nick_name                   |string|null: false                        |
|email                       |string|null: false unique: true           |
|encrypted_password          |string|null: false                        |
|family_name                 |string|null: false                        |
|family_name_zenkaku_katakana|string|null: false                        |
|first_name                  |string|null: false                        |
|first_name_zenkaku_katakana |string|null: false                        |
|birthday                    |date  |null: false                        |

has_many :items



items

|Column               |Type      |Options                      |
|brand_name           |string    |null: false                  |
|price                |integer   |null: false                  |
|description_item     |text      |null: false                  |
|category_id          |integer   |null: false                  |
|status_id            |integer   |null: false                  |
|fee_id               |integer   |null: false                  |
|send_day_id          |integer   |null: false                  |
|shipping area_id     |integer   |null: false foreign_key: true|
|user                 |references|null: false foreign_key: true|

belong_to :user
has_one :buy_log


buy_log

|Column  |Type      |Options                      |
|user    |references|null: false foreign_key: true|
|items   |references|null: false foreign_key: true|

belong_to :items
has_one :buyer_address
belong_to :user

buyer_address

|Column          |Type      |Options                      |
|postal_code     |string    |null: false                  |
|todoufuken_id   |integer   |null: false                  |
|city            |string    |null: fal                    |
|address         |string    |null: false                  |
|building_name   |string    |                             |
|phone_number    |string    |null: false                  |
|buy_log         |references|null: false foreign_key: true|

belong_to :buy_log
