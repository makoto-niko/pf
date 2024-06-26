users_data = [
  { username: '佐藤 健太', password: 'KentaSato123', email: 'kenta.sato@example.com' },
  { username: '鈴木 花子', password: 'HanakoSuzuki456', email: 'hanako.suzuki@example.com' },
  { username: '高橋 幸一', password: 'KoichiTakahashi789', email: 'koichi.takahashi@example.com' },
  { username: '田中 美咲', password: 'MisakiTanaka101', email: 'misaki.tanaka@example.com' },
  { username: '伊藤 明美', password: 'AkemiIto202', email: 'akemi.ito@example.com' },
  { username: '山本 太郎', password: 'TaroYamamoto303', email: 'taro.yamamoto@example.com' },
  { username: '中村 桃子', password: 'MomokoNakamura404', email: 'momoko.nakamura@example.com' },
  { username: '小林 一郎', password: 'IchiroKobayashi505', email: 'ichiro.kobayashi@example.com' },
  { username: '加藤 結衣', password: 'YuiKato606', email: 'yui.kato@example.com' },
  { username: '吉田 雄大', password: 'YudaiYoshida707', email: 'yudai.yoshida@example.com' }
]

# ユーザーデータをシードに挿入する
users_data.each do |user_data|
  User.create!(
    username: user_data[:username],
    password: user_data[:password],
    email: user_data[:email]
  )
end


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ username: 'Star Wars' }, { username: 'Lord of the Rings' }])
#   Character.create(username: 'Luke', movie: movies.first)
