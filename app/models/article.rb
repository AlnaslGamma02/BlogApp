class Article < ApplicationRecord
  # 1つの記事は複数のコメントを持てる
  # 記事が削除されたらコメントも削除される
  has_many  :comments, dependent: :destroy

  # 記事の入力は必須。長さは5以上であること。
  validates :title, presence: true, length: { minimum: 5 }
end
