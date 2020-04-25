# README

* アプリ名
SHOW OFF

* 概要
このアプリケーションに実装されている内容は以下の通りです。
 - ユーザー情報の登録
 - ユーザー詳細画面
 - フォロー機能（改善中）
 - ダイレクトメッセいーじ機能（改善中）
 - 投稿一覧画面
 - 画像投稿機能（UI、機能改善中）
 - 投稿へのコメント機能

* 本番環境(デプロイ先 テストアカウント＆ID)
準備中

* 作成意図
主に2点です。
 - 1.楽器奏者特化型の写真投稿コミュニケーションツールを作成したい
 - 2.学んだことを復習して知識を定着化させる

## 1.楽器奏者特化型の写真投稿コミュニケーションツールを作成したい
音楽をやっている人にとって、楽器は必需品です。
中には身体が楽器だ。という方もいらっしゃいますが、楽器を買ったり作ったりしてそれを奏でる事も多いと思います。
「新しく機材を買ったよ。その使い勝手がこんな感じだよ」といった口コミ的な投稿や
「長年使っている自分の相棒を見せびらかしたい！どうだい？かっこいいだろ！？」と自慢する投稿
そういった自慢の相棒を好きなだけ自慢して、気になった人同士でコミュニケーションをとって、一緒に音楽を奏でる機会を作る。

そういった音楽マン向けのアプリケーションを作成したいと思いました。

## 2.学んだことを復習して知識を定着化させる
まだまだ勉強を初めて間も無い状態です。
まずは学んだことを実践して、知識として定着させるために作成中です。
学んでいる途中に並行して作成しているため「ここもっとこうするべきだった」といった点が多いので、
少しずつリファクタをしていこうと考えています。

* 工夫したポイント
気づける範囲で、ソースコードの使い回しをするようにしています。
例えば「ユーザー詳細画面」で、そのユーザーが投稿したリストを表示する際、render にて投稿一覧画面のviewを流用したりしています。

一部画面でレスポンシブ対応を実装しています。
ただ、後から実装したためソースコードがかなり汚くなっています。
事前に計画がいかに重要なのかを体感しました。

* 課題や今後実装したい機能
現状掲げている課題は以下の通りです。
## 今後実装したい機能
 - カテゴリー検索機能の実装とカテゴリー一覧画面の実装
 - 通知機能の追加
 - 投稿機能の拡張

## 現状掲げている課題
 - フォロー機能の改善
 - 手が回っていない細かいviewの修正

