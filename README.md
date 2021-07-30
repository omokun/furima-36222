# テーブル設計

## users テーブル

|Column             |Type      |Options                   |
|-------------------|----------|--------------------------|
|nickname           |string    |null: false               |
|email              |string    |null: false, unique: true |
|encrypted_password |string    |null: false               |
|last_name          |string    |null: false               |
|first_name         |string    |null: false               |
|last_name_kana     |string    |null: false               |
|first_name_kana    |string    |null: false               |
|birthday_year      |date      |null: false               |
|birthday_month     |date      |null: false               |
|birthday_day       |date      |null: false               |

### Association
- has_many :items
- has_many :purchase_records

## items テーブル

|Column           |Type       |Options                              |
|-----------------|-----------|-------------------------------------|
|name             |string     |null: false                          |
|item_description |text       |null: false                          |
|category         |integer    |null: false                          |
|item_condition   |integer    |null: false                          |
|shipping_cost    |integer    |null: false                          |
|shipping_area    |integer    |null: false                          |
|shipping_time    |integer    |null: false                          |
|price            |integer    |null: false                          |
|user             |references |null: false, foreign_key: true       |

### Association
- belongs_to :user
- has_one :purchase_records

## purchase_record テーブル

|Column    |Type          |Options                              |
|----------|--------------|-------------------------------------|
|user      |references    |null: false, foreign_key: true       |
|item      |references    |null: false, foreign_key: true       |

### Association
- belongs_to :item
- belongs_to :user
- has_one :shipping_address

## shipping_address テーブル

|Column           |Type         |Options                              |
|-----------------|-------------|-------------------------------------|
|postal_code      |string       |null: false                          |
|Region　　　      |integer      |null: false                          |
|city             |string       |null: false                          |
|street           |string       |null: false                          |
|building         |string       |                                     |
|phone            |string       |null: false                          |
|purchase_record  |references   |null: false, foreign_key: true       |

### Association
belongs_to :purchase_record