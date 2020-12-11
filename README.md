# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false ,unique: true |
| email              | string  | null: false ,unique: true |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birth_day          | integer | null: false               |
| encrypted_password | string  | null: false ,unique: true |

### Association

- has_many :photos

## photos テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| situation_id  | integer    | null: false                    |
| weather_id    | integer    | null: false                    |
| month_id      | integer    | null: false                    |
| camera_id     | integer    | null: false                    |
| lens_id       | integer    | null: false                    |
| comment       | text       |                                |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :area

## areas テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| area     | string     | null: false, foreign_key: true |
| area_id  | references | null: false, foreign_key: true |
| image_id | references | null: false, foreign_key: true |

### Association

- has_many :photos
