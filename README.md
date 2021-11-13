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

has many goods



goods

|Column          |Type   |Options    |
|brand_name      |string |null: false|
|price           |integer |null: false|
|description_item|text |null: false|
|category_id        |integer |null: false|
|status_id          |integer |null: false|
|fee_id             |integer |null: false|
|day_id             |integer |null: false|
|user_id         |references|null: false|

belong to users
belong to buy_log


buy_log

|Column  |Type   |Options    |
|user_id |references|null: false|
|goods_id|references|null: false|

has many goods
has one buy_log


buyer_address

|Column       |Type   |Options    |
|postal_code  |string |null: false|
|todoufuken_id   |integer | |null: false|
|city         |string |null: false|
|address      |string |null: false|
|building_name|string |           |
|phone_number |string |null: false|
|buy_log_id   |references|null: false|

belong to buyer_address