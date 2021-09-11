# テーブル設計



## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| year_of_birth      | string | null: false |
| month_of_birth     | string | null: false |
| day_of_birth       | string | null: false |

### Association

- has_many :items
- has_many :buys





## items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| image       | string     | null: false                    |
| name        | string     | null: false                    |
| explanation | string     | null: false                    |
| category    | string     | null: false                    |
| status      | string     | null: false                    |
| postage     | string     | null: false                    |
| post_source | string     | null: false                    |
| take_days   | string     | null: false                    |
| price       | string     | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :buy





## buys テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_number    | string     | null: false                    |
| prefecture     | string     | null: false                    |
| municipalities | string     | null: false                    |
| address        | string     | null: false                    |
| building       | string     | null: false                    |
| phone_number   | string     | null: false                    |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
