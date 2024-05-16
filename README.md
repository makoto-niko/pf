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


## 使用GEM
- [devise](https://github.com/heartcombo/devise)
- [enum_help](https://github.com/zmbacker/enum_help)
- [kaminari](https://github.com/kaminari/kaminari)
- [dotenv-rails](https://github.com/bkeepers/dotenv)
- [rails-i18n](https://github.com/svenfuchs/rails-i18n)

## 使用方法
<img width="616" alt="スクリーンショット 2024-05-16 16 25 56" src="https://github.com/makoto-niko/pf/assets/156491237/5b6b375b-5735-4464-b464-7dacb35b693e">
<img width="613" alt="スクリーンショット 2024-05-14 11 00 54" src="https://github.com/makoto-niko/pf/assets/156491237/48dc68ac-799d-431a-b817-0f4aa0fb47ed">

### インストール方法

1. gitからアプリをクローン

    ```
     git clone git@github.com:makoto-niko/pf.git
    ```

2. bundle install

    ```
    bundle install
    ```

3. yarn install

    ```
    yarn install
    ```

4. データベースをマイグレートする

    ```
    rails db:migrate
    ```

5. 管理者用にシードデータをインストール

    ```
     rails db:seed
    ```

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9

### 使用技術

​[![](https://img.shields.io/badge/Ruby-CC342D?style=flat&logo=ruby&logoColor=white)](https://www.ruby-lang.org/)
[![](https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=flat&logo=ruby-on-rails&logoColor=white)](https://rubyonrails.org/)
[![](https://img.shields.io/badge/HTML-1572B6?style=flat&logo=html5&logoColor=white&color=orange)](https://example.com)
[![](https://img.shields.io/badge/CSS-1572B6?style=flat&logo=css3&logoColor=white)](https://www.w3.org/Style/CSS/Overview.en.html)
[![](https://img.shields.io/badge/JavaScript-F7DF1E?style=flat&logo=javascript&logoColor=black)](https://developer.mozilla.org/en-US/docs/Web/JavaScript)
[![](https://img.shields.io/badge/Bootstrap-563D7C?style=flat&logo=bootstrap&logoColor=white)](https://getbootstrap.com/)
[![](https://img.shields.io/badge/GitHub-181717?style=flat&logo=github&logoColor=white)](https://github.com/)
[![](https://img.shields.io/badge/Git-F05032?style=flat&logo=git&logoColor=white)](https://git-scm.com/)
[![](https://img.shields.io/badge/Amazon_AWS-232F3E?style=flat&logo=amazon-aws&logoColor=white)](https://aws.amazon.com/)
[![](https://img.shields.io/badge/Amazon_EC2-232F3E?style=flat&logo=amazon-ec2&logoColor=white)](https://aws.amazon.com/ec2/)
[![](https://img.shields.io/badge/Amazon_RDS-232F3E?style=flat&logo=amazon-rds&logoColor=white)](https://aws.amazon.com/rds/)
[![](https://img.shields.io/badge/Nginx-009639?style=flat&logo=nginx&logoColor=white)](https://nginx.org/)
[![](https://img.shields.io/badge/MySQL-4479A1?style=flat&logo=mysql&logoColor=white)](https://www.mysql.com/)
