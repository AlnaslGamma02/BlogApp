class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable,
        :confirmable, :lockable, :timeoutable

  # 1人のユーザーは複数のコメントを持てる
  has_many :comments
  # comment テーブルを経由して1人のユーザーが記事を複数持てる
  has_many :articles, through: :comments

  # バリデーション
  validates :name, presence: true
end
