# テーブル設計

## usersテーブル

| Colum              |  Type        | Options       |  
| ------------------ | ------------ | ------------- |  
| nickname           | string       | null: false   | 
| email              | string       | null: false   |
| encrypted_password | string       | null: false   |

### Association
  has_many :miniblogs
  has_many :comments

## miniblogsテーブル
| Colum         | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| title         | string     | null: false                   |
| text          | text       | null: false                   |
| user_id       | references | null: false,foreign_key: true |

### Association
  belongs_to :user
  has_many :comments

## commentsテーブル

| Colum           | Type          | Options                       |
| --------------- | ------------- | ----------------------------- |
| text            | text          | null: false                   |
| user_id         | references    | null: false,foreign_key: true |
| miniblog_id     | references    | null: false,foreign_key: true |

### Association
belongs_to :user
belongs_to :miniblog
