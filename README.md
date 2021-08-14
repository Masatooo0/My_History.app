# My History 自己分析アプリ
### サイトURLはこちら http://myhistory.work
![logo](https://user-images.githubusercontent.com/76051613/129445722-8acd9822-ea7f-430d-a177-013fa8dbd562.png)

「**My History**」とは、
自己分析を通じて人生の価値観を確立するためのWebアプリケーションです。<br>
過去の出来事を振り返ることで<br>
「何になりたいかではなくどう生きたいか」を考えることができます。<br>

### 🍀サイトテーマ
自分にとっての「幸せ」を見つけるサイト

### 🍀テーマを選んだ理由
私自身が就職活動時に<br>
これまでの経験、考えなどを紙に書き起こしたことで<br>
本当に大切なことは自分にとって幸せは何か、<br>
どう生きたいかを考えることであると気づきました。<br>

昨今、仕事が楽しくないという大人が増えてきています。<br>
それは明確な目的があって仕事を選んでいないからであると考えています。<br>

多くの人に自己分析をしていただき<br>
どう生きたいか、何が幸せなのかを確立し、<br>
生き方、仕事選びに取り組んでいただきたいと思い<br>
こちらの製作を決めました。<br>

### 🍀ターゲットユーザ
- 自分にとっての「幸せ」がわからない方<br>
- 将来の目標がない方<br>
- 就職活動の自己分析をする方<br>

### 🍀主な利用シーン
- 自分の人生を振り返る
- 短期目標を設定する

### ✏️データベース設計
ER図
![HyHistoryER図](https://user-images.githubusercontent.com/76051613/129445854-b187ed0e-a4a4-4d65-910d-ef7ba9065455.png)

[テーブル定義書](https://docs.google.com/spreadsheets/d/12TBIObTYQj7h38On4CKHU4OSkXmoq5hlDgSt--yUCdM/edit?usp=sharing)

### ✏️ 詳細設計
[アプリケーション詳細設計書](https://docs.google.com/spreadsheets/d/1vbFiZR5PPAh0QqpAlJgNTZUfRLIioMnXT3rzRznnfXo/edit?usp=sharing)

## チャレンジ要素一覧
https://docs.google.com/spreadsheets/d/1MaX8lhYeN4K8YJqkVEvbLKzs6NrQEQAYwEWxFMuAKjo/edit?usp=sharing

## 🛠 使用技術
- Ruby 2.6.3
- Ruby on Rails 5.2.6
- MySQL 5.7.22
- Nginx
- Puma
- AWS
  - EC2
  - RDS
  - Route53

## 🛠 アプリ機能
- ユーザー認証機能(devise)
  - 会員側
- 投稿機能
- 通知機能
- カウントダウン機能
- お問い合わせ機能
  - メール送信(Action Mailer)
- 画像アップロード機能(refile)
- グラフ(chart.js)

## 開発環境
- OS:Linux(Amazon Linux 2)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9

## 使用素材
- Font Awesome <https://fontawesome.com/>ｓ>さん
- Storyset <https://storyset.com/>さん
- fhoto AC <https://www.photo-ac.com/>さん