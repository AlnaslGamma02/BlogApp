class Article < ApplicationRecord
  # 1つの記事は複数のコメントを持てる
  # 記事が削除されたらコメントも削除される
  has_many  :comments, dependent: :destroy

  # comment テーブルを経由して1つの記事がユーザーを複数持つ
  # 不要かも？将来的には必要になる？
  has_many  :users, through: :comments

  # 記事のタイトル入力は必須。長さは5以上であること。
  validates :title, presence: true, length: { minimum: 5 }
end
