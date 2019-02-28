require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = users(:john)
  end

  # 上記のユーザー情報が有効か
  test "should be valid" do
    assert @user.valid?
  end

  # name のバリデーション(存在性)が効いているか
  test "name should be present" do
    @user.name = "     "
    assert_not @user.valid?
  end

  # email のバリデーション(存在性)が効いているか
  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

  # ユーザが削除されたと同時に記事が削除されるか
  # test "associated articles should be destroyed" do
  #   @user.save
  #   @user.articles.create!(title: "test text",text: "test text")
  #   assert_difference 'Article.count', -1 do
  #     @user.destroy
  #   end
  # end
end
