# 📱 アプリケーション名
## kirei

# 💭 アプリケーション概要
## 掃除した前後を写真に撮り、変化を比較することを目的としたアプリです。画像を載せたミニブログを投稿できます。

# 🌐 App URL
## https://kireiminiblog.herokuapp.com/

![86d59fb9eb0f1bf3940e74d09261361b](https://user-images.githubusercontent.com/73686164/105003157-a7ee0700-5a75-11eb-96e0-40a814f29d09.gif)
![e537c3a0f456a7fdca5920014ef983b8](https://user-images.githubusercontent.com/73686164/105003639-41b5b400-5a76-11eb-8704-3ca209c86d12.gif)

# テスト用アカウント
- email: test@gmail.com
- password: test1234

# 💻 利用方法
- 新規登録画面よりユーザー登録をします。
- ログイン後、トップページが表示され、ユーザーが投稿したものが一覧になって表示されます。
- 新規投稿を行う場合は、ヘッダーの新規投稿リンクより投稿フォームに遷移できます。投稿フォームに必要事項入力後、投稿ボタンを押すことでミニブログが投稿できます。
- 画像は2枚まで投稿することができます。
- マイページには自分が投稿したミニブログが一覧で表示されます。
- 詳細ページは投稿の詳細が確認できます。投稿一覧ではテキストの表示はしていませんが、詳細ページはテキストも表示されています。
- ミニブログのいいね機能は詳細ページの星マークボタンを押すことによりいいねができます。
- 自分が投稿したミニブログは右上に編集と削除ボタンが表示されているため、そこから各ページに遷移ができます。
- トップページ右側にはいいね数が多い投稿が上位3つまで表示されます。
- ログアウトはヘッダーのヘッダーのリンクよりログアウトができます。

# ✅ 目指した課題解決
- 部屋の掃除をして前後を比較することにより掃除のモチベーションアップや達成感を得る為のアプリになります。今年に入り自宅での作業が多くなる中、掃除してもすぐ散らかってしまうので画像に残し、可視化することを目的としております。

# 🔍 洗い出した要件定義
| 機能 | 目的 |
|----|-------|
|ユーザー管理機能|ユーザー情報を登録する機能|
|ミニブログ投稿機能|前後を比較するための可視化|
|ミニブログ一覧表示機能|他のユーザーの投稿を閲覧できる機能|
|ミニブログ投稿編集機能|投稿したものを編集する機能|
|ミニブログ投稿削除機能|投稿の削除|
|マイページ機能|自分が投稿したものを閲覧できる|
|ミニブログ投稿詳細機能|投稿したものをの詳細を表示する機能|
|コメント投稿機能|投稿したものにコメントする機能|
|いいね機能|投稿にいいねする機能|
|ランキング機能|投稿のお気に入り数の数が多い3個までの投稿を順番にページ左部分に並べる|

# 📖 実装した機能についての説明
|機能|詳細｜
|----------|---|
|ユーザー管理機能|・新規登録画面からユーザー情報を登録する<br>・登録後はログイン画面からログインできる|
|ミニブログ投稿機能|・画像を2枚並べる<br>・beforeとafterを明確にして差を明確にする<br>・ユーザーのみ投稿可能|
|ミニブログ一覧表示機能|・一覧表示で表示される内容はtitle,text,画像のみ<br>・投稿は1ページに4枚まで<br>・投稿したものには投稿したユーザーのみメニューボタンが表示される|
|ミニブログ投稿編集機能|・投稿した物を編集ボタンから編集する<br>・ユーザーのみ編集可能|
|ミニブログ投稿削除機能|・投稿した画像を削除ボタンから削除する<br>・ユーザーのみ削除可能|
|マイページ機能|・ログインしているユーザーが登録したものを一覧で表示できる|
|ミニブログ投稿詳細機能|・投稿内容の詳細表示<br>・詳細ページから投稿にコメントができる|
|コメント投稿機能|・詳細ページからコメントを投稿できる<br>・ユーザーのみコメント可能|
|いいね機能|・投稿詳細ページの下部にお気に入りボタンを設置し、押すと色が変わる機能|
|ランキング機能|・いいねの数が多い順に3つまでの投稿がトップページの左に表示される|

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
  has_many :likes

## miniblogsテーブル
| Colum         | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| title         | string     | null: false                   |
| text          | text       | null: false                   |
| user_id       | references | null: false,foreign_key: true |

### Association
  belongs_to :user
  has_many :comments
  has_many :likes

## commentsテーブル

| Colum           | Type          | Options                       |
| --------------- | ------------- | ----------------------------- |
| text            | text          | null: false                   |
| user_id         | references    | null: false,foreign_key: true |
| miniblog_id     | references    | null: false,foreign_key: true |

### Association
belongs_to :user
belongs_to :miniblog

## likesテーブル
| Colum           | Type          | Options                       |
| --------------- | ------------- | ----------------------------- |
| user_id         | references    | null: false,foreign_key: true |
| miniblog_id     |references     | null: false,foreign_key: true |

### Association
belongs_to :user
belongs_to :miniblog


# ER図
[![Image from Gyazo](https://i.gyazo.com/4e0ca5c1e4a9af41bfba2cd8233f2f3b.png)](https://gyazo.com/4e0ca5c1e4a9af41bfba2cd8233f2f3b)

# 🚜 開発環境
### Ruby version
- Ruby 2.6.5p114
### Rails version
- Rails 6.0.3.4
### RubyGems version
- 3.0.3
