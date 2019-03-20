class Comment < ApplicationRecord
  # １つのコメントは1つの記事に属する
  belongs_to :article
  # １つのコメントは1人のユーザーに属する
  belongs_to :user

  # バリデーション
  validates :user_id, presence: true
  validates :body, presence: true, allow_nil: true
end
