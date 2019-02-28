require 'test_helper'

class ArticleTest < ActiveSupport::TestCase

  def setup
    @user    = users(:john)
    @article = @user.articles.build(title: "test text",text: "test text")
  end

  # 記事が有効か
  test "should be valid" do
    assert @article.valid?
  end

  # ユーザIDに対してバリデーションが効いているか
  # test "user id should be present" do
  #   @article.comments.user_id = nil
  #   assert_not @article.valid?
  # end

  # 記事一覧を表示した時、降順に並んでいるか
  test "order should be most recent first" do
    assert_equal articles(:Geralt_of_Rivia), Article.first
  end
end
