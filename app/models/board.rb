class Board < ApplicationRecord
    belongs_to :group
    belongs_to :user
    has_many :comments
    has_many :board_tags, dependent: :destroy
    has_many :tags, through: :board_tags
  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 100 }

  def save_tags_new(tags)
    board_tags.destroy_all
    tag_list = tags.present? ? tags.split(/[[:blank:]]+/) : []
    tag_list.each do |tag_name|
     tag = Tag.find_or_create_by(name: tag_name)
     self.tags << tag
    end
  end
  
  def save_tags(tags)

    # タグをスペース区切りで分割し配列にする
    #   連続した空白も対応するので、最後の“+”がポイント
    #tag_list = tags.split(/[[:blank:]]+/)
    tag_list = tags.present? ? tags.split(/[[:blank:]]+/) : []

    # 自分自身に関連づいたタグを取得する
    current_tags = self.tags.pluck(:name)

    # (1) 元々自分に紐付いていたタグと投稿されたタグの差分を抽出
    #   -- 記事更新時に削除されたタグ
    old_tags = current_tags - tag_list

    # (2) 投稿されたタグと元々自分に紐付いていたタグの差分を抽出
    #   -- 新規に追加されたタグ
    new_tags = tag_list - current_tags

    # tag_mapsテーブルから、(1)のタグを削除
    #   tagsテーブルから該当のタグを探し出して削除する
    old_tags.each do |old|
      # tag_mapsテーブルにあるpost_idとtag_idを削除
      #   後続のfind_byでtag_idを検索
      self.tags.delete Tag.find_by(name: old)
    end

    # tagsテーブルから(2)のタグを探して、tag_mapsテーブルにtag_idを追加する
    new_tags.each do |new|
      # 条件のレコードを初めの1件を取得し1件もなければ作成する
      # find_or_create_by : https://railsdoc.com/page/find_or_create_by
      new_post_tag = Tag.find_or_create_by(name: new)

      # tag_mapsテーブルにpost_idとtag_idを保存
      #   配列追加のようにレコードを渡すことで新規レコード作成が可能
      self.tags << new_post_tag
    end
  end
  enum status: { public_status: 0, private_status: 1 }
end
