# テーブル設計

## usersテーブル

| Column   | Type    | Options     |
| -------- | ------- | ----------- |
| name     | string  | null: false |
| email    | string  | null: false |
| password | string  | null: false |

## Association

- has_many :room_users
- has_many :rooms, through: room_users
- has_many :comments
- belongs_to :u_memo
- belongs_to :my_memo


## roomsテーブル

| Column  | Type   | Options     |
| ------- | ------ | ----------- |
| tname   | string | null: false |

## Association

- has_many :room_users
- has_many :users, through: room_users
- has_many :comments
- belongs_to :r_memo


## room_usersテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| room     | references | null: false, foreign_key: true |

## Association

- belongs_to :room
- belongs_to :user


## commentsテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| content  | string     |                                |
| user     | references | null: false, foreign_key: true |
| room     | references | null: false, foreign_key: true |

## Association

- belongs_to :room
- belongs_to :user


## u_memosテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| u_text   | string     |                                |
| user     | references | null: false, foreign_key: true |

## Association

- belongs_to :user


## r_memosテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| r_text   | string     |                                |
| room     | references | null: false, foreign_key: true |

## Association

- belongs_to :room


## my_memosテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| m_text   | string     |                                |
| user     | references | null: false, foreign_key: true |

## Association

- belongs_to :user


## contactsテーブル

| Column   | Type       | Options     |
| -------- | ---------- | ----------- |
| message  | string     |             |