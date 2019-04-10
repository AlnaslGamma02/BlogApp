# ブログアプリケーション

これは、私が作成したポートフォリオ（ブログアプリケーション）です。

実際に動作するページは[こちら](https://calm-garden-94571.herokuapp.com)です。
※初回アクセス時、ページを開くまでに時間が掛かる場合があります。

## アプリの機能

- ユーザー認証機能
- ブログ記事の投稿/編集/削除/閲覧機能
- 画像投稿機能
- ページネーション機能
- コメントの投稿/削除機能

## 使用した言語・フレームワークなど(主要な物)

- Ruby 2.4
- Ruby on Rails 5.1 (Webアプリケーションフレームワーク)
- Bootstrap 4 (CSSフレームワーク)
- Font Awesome (Webアイコンフォント)
- HTML
- CSS
- PostgreSQL (データベース)
- Puma (HTTP サーバー)
- AWS S3 (クラウドストレージ（投稿画像保存用）)
- Gem (Ruby のライブラリ・拡張機能)
  - devise (ユーザー認証)
  - will_paginate (ページネーション)
  - carrierwave (画像投稿)
- Heroku (デプロイ先のPaaS)
- CentOS 7 (Windows8.1 + Vagrant + VirtualBox 上に構築)

## ライセンス

ソースコードはMITライセンスのもとで公開されています。
詳細は [LICENSE.txt](LICENSE.txt) をご覧ください。

## 使い方

このアプリケーションを動かす場合は、まずはリポジトリを手元にクローンしてください。
その後、次のコマンドで必要になる RubyGems をインストールします。

```
$ bundle install --without production
```

その後、データベースへのマイグレーションを実行します。

```
$ rails db:migrate
```

データベースへデータを登録する場合は、下記を実行してください。

```
$ rails db:seed
```

最後に、テストを実行してうまく動いているかどうか確認してください。

```
$ rails test
```

テストが無事に通ったら、Railsサーバーを立ち上げる準備が整っているはずです。

```
$ rails server
```
