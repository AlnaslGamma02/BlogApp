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
end
