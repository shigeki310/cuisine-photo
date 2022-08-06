# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## users　 テーブル

|Column              |Type     |Options                    |
|--------------------|---------|---------------------------|
|nickname            |string   |null: false                |
|email               |string   |null: false, unique: true  |
|encrypted_password  |string   |null: false                |

### Association

- has_many :photos
- has_many :comments

## photos テーブル

|Column              |Type       |Options                        |
|--------------------|-----------|-------------------------------|
|nickname            |string     |null: false                    |
|title               |string     |null: false                    |
|description         |text       |null: false                    |
|user                |references |null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## comments テーブル

|Column              |Type       |Options                        |
|--------------------|-----------|-------------------------------|
|content             |text       |null: false                    |
|photo               |references |null: false, foreign_key: true |
|user                |references |null: false, foreign_key: true |

- belongs_to :user
- belongs_to :photo 
