class Article < ApplicationRecord
  # 1つの記事は複数のコメントを持てる
  # 記事が削除されたらコメントも削除される
  has_many  :comments, dependent: :destroy
  has_many  :users, through: :comments

  # デフォルトのスコープ
  default_scope -> { order(created_at: :desc) }

  # 画像アップローダ
  mount_uploader :picture, PictureUploader

  # 記事のタイトル入力は必須。長さは5以上であること。
  validates :title, presence: true, length: { minimum: 5 }
  # 画像サイズのバリデーション
  validate  :picture_size

  private

    # アップロードされた画像のサイズをバリデーションする
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "画像サイズは5MB以下にして下さい。")
      end
    end
end
