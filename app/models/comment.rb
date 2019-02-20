class Comment < ApplicationRecord
  # 1つのコメントは1つの記事に属する
  belongs_to :article
end
