class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable,
        :confirmable, :lockable, :timeoutable

  # 1人のユーザは複数のコメントを持てる
  has_many :comments
  # comment テーブルを経由して1人のユーザが記事を複数持てる。
  # ユーザが削除された時、記事も削除される。
  has_many :articles, through: :comments, dependent: :destroy

  # バリデーション
  validates :username, presence: true
end
