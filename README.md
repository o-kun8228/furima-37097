users

|Column                      |Type  |Options    |
|nick_name                   |string|null: false|
|email                       |string|null: false|
|encrypted_password          |string|null: false|
|family_name                 |string|           |
|family_name_zenkaku_katakana|string|           |
|first_name                  |string|           |
|first_name_zenkaku_katakana |string|           |
|birthday                    |date  |null: false|



goods

|Column          |Type   |Options    |
|goods_user_name |string |null: false|
|brand_name      |string |null: false|
|image           |string |null: false|
|price           |string |null: false|
|description_item|string |null: false|
|category        |string |null: false|
|status          |string |null: false|
|fee             |string |null: false|
|day             |string |null: false|
|user_id         |integer|null: false|


buy_log

|Column  |Type   |Options    |
|user_id |integer|null: false|
|goods_id|integer|null: false|


buyer_address

|Column       |Type   |Options    |
|postal_code  |string |null: false|
|todoufuken   |string |null: false|
|city         |string |null: false|
|address      |string |null: false|
|building_name|string |null: false|
|phone_number |string |null: false|
|buy_log_id   |integer|null: false|
