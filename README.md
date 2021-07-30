# テーブル設計

## users テーブル

|Column          |Type      |Options           |
|----------------|----------|------------------|
|niickname       |string    |null: false       |
|mail            |string    |null: false       |
|password        |string    |null: false       |
|last_name       |string    |null: false       |
|first_name      |string    |null: false       |
|last_name_kana  |string    |null: false       |
|first_name_kana |string    |null: false       |

### Association
- has_many :items
- has_many :purchas_records

## items テーブル

|Column           |Type       |Options           |
|-----------------|-----------|------------------|
|image            |text       |null: false       |
|name             |string     |null: false       |
|item_description |text       |null: false       |
|price            |integer    |null: false       |
|user             |references |null: false       |

### Association
- belongs_to :user
- has_one :purchas_record

## purchas_record テーブル

|Column    |Type          |Options           |
|----------|--------------|------------------|
|user      |references    |null: false       |
|item      |references    |null: false       |

### Association
- belongs_to :items
- belongs_to :user
- has_many :shipping_addresses

## shipping_address テーブル

|Column           |Type         |Options           |
|-----------------|-------------|------------------|
|postal_code      |integer      |null: false       |
|city             |string       |null: false       |
|street           |string       |null: false       |
|building         |string       |                  |
|phone            |integer      |null: false       |
|shipping_address |references   |null: false       |

### Association
belongs_to :purchas_record