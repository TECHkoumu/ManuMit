# テーブル設計

## usersテーブル

| Column             |  Type  |     Options |
| ------------------ | ------ | ----------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| name               | string | null: false |
| department_id      | integer | null: false, default: 0 |
| position_id        | integer | null: false, default: 0 |



## Association
- has_many :manuals
- has_many :comments

## ユニーク制約の追加
`users`テーブルの`email`カラムにユニーク制約を追加する方法
1. マイグレーションファイルを作成
   ```ruby
   class AddUniqueIndexToUsersEmail < ActiveRecord::Migration[6.1]
     def change
       add_index :users, :email, unique: true
     end
   end

2.マイグレーション実行
% rails db:migrate

3.rails test

## manualsテーブル

| Column     | Type       | Options    |
| ---------- | ---------- | ---------- |
| title      |   string   | null: false|
| concept    |    text    | null: false|
| user_id    | references | null: false,foreign_key: true|
| department_id | integer | null: false, default: 0 |
| division_id   | integer | null: false, default: 0 |
| clerk_id      | integer | null: false, default: 0 |

## Association
- belongs_to :users
- has_many :comments
- has_one_attached:file

## commentsテーブル

| Column       | Type       | Options                       |
| ------------ | ---------- | ----------------------------- |
| content      | text       | null: false                   |
| manual_id    | references | null: false, foreign_key:true |
| user_id      | references | null: false, foreign_key:true |


## Association

- belong_to :users
- belong_to :manuals


