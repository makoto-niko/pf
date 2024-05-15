# トランスコネクト (TransConnect)

## サイト概要

### サイトテーマ
性同一性障害当事者のための情報共有と経験談交流サイト

### テーマを選んだ理由
自分自身が性同一性障害であり、治療は全て終了したが、個人的な悩みなどを相談する場がないと悩ませていました。

特に現状では、LGBTへの理解が深めていきたいと社会の方針が進んでいます。

ですが、実際には当事者の面で考えると、まだまだ理解は進んでいないと感じる場面が多いです。

また、偶然にも知人に同一の疾患の方がおり、自分を頼って相談してきた方もいたため、相談などができる場があれば良いと感じたためです。

性同一性障害当事者が直面する日常生活での悩みや経験を共有し、互いに共感し合える場が必要だと感じ、

医療的な情報よりも、当事者目線での経験や感情面に焦点を当てることで、より当事者に寄り添ったコミュニティを作りたいと考えました。

さらに、友人にもどう対応したら良いかわからないと困っていた様子であったため、理解を深めたい方にも助けになると考え、このようなテーマにしました。

### ターゲットユーザー

- 性同一性障害当事者
- 性同一性障害当事者の家族や友人
- 性同一性障害について理解を深めたい一般の方

### 主な利用シーン

- 日常生活での悩みや不安を抱えた時に、同じ経験を持つ人からアドバイスをもらう
- 自身の経験談を共有することで、他の当事者の支えになりたい時
- 性同一性障害について理解を深めたい時に、当事者の生の声を知る
- 孤独感を感じた時に、同じ境遇の人と繋がりを持ちたい時

### 今後の展望

- イベントや交流会の告知機能の追加
- 関連書籍やコラムの紹介コーナーの設置

## 設計書
<img width="572" alt="スクリーンショット 2024-04-27 23 00 48" src="https://github.com/makoto-niko/pf/assets/156491237/de2c364c-6c68-45ab-aa5f-cc6e96047f18">

<img width="612" alt="スクリーンショット 2024-04-27 22 44 04" src="https://github.com/makoto-niko/pf/assets/156491237/22133ce3-4284-44f7-8f80-573dde295209">

## 使用GEM
- [devise](https://github.com/heartcombo/devise)
- [enum_help](https://github.com/zmbacker/enum_help)
- [kaminari](https://github.com/kaminari/kaminari)
- [dotenv-rails](https://github.com/bkeepers/dotenv)
- [rails-i18n](https://github.com/svenfuchs/rails-i18n)

## 使用方法

### インストール方法

1. gitからアプリをクローン

    ```
    $ git clone git@github.com:makoto-niko/pf.git
    ```

2. bundle install

    ```
    $ bundle install
    ```

3. yarn install

    ```
    $ yarn install
    ```

4. データベースをマイグレートする

    ```
    $ rails db:migrate
    ```

5. 管理者用にシードデータをインストール

    ```
    $ rails db:seed
    ```

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9

### 使用技術
![image](https://github.com/webcamp-Jump/nagano_cake/assets/9004618/20f0ab96-f3ef-400c-a475-5afa6c44d465)
![image](https://github.com/webcamp-Jump/nagano_cake/assets/9004618/c5376540-d329-4dae-b997-eb4a6d164489)
![image](https://github.com/webcamp-Jump/nagano_cake/assets/9004618/820ad9e9-4c2f-489a-8434-ff6e81f02db2)
![image](https://github.com/webcamp-Jump/nagano_cake/assets/9004618/21570ae0-f3ed-4179-a330-9c16da6b62e6)
![image](https://github.com/webcamp-Jump/nagano_cake/assets/9004618/20407384-322d-446c-93b5-bb02c840d805)
![image](https://github.com/webcamp-Jump/nagano_cake/assets/9004618/f1c3fa28-1a9e-4ee9-8d41-3887f1dbd55c)
![image](https://github.com/webcamp-Jump/nagano_cake/assets/9004618/0cfad73c-915a-434c-b503-0ddba352ddc6)
![image](https://github.com/webcamp-Jump/nagano_cake/assets/9004618/f10b9e02-8159-4f18-909b-b5e8ca52bf1e)
<img src="https://img.shields.io/badge/-Bootstrap-563D7C.svg?logo=bootstrap&style=flat">