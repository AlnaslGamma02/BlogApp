class Comment < ApplicationRecord
  # １つのコメントは1つの記事に属する
  belongs_to :article
  # １つのコメントは1人のユーザーに属する
  belongs_to :user

  # ユーザIDの存在性のバリデーション
  validates :user_id, presence: true
end
