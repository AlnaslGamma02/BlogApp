class CommentsController < ApplicationController
  # ログインするようユーザーに要求する。
  before_action :authenticate_user!

  def create
    # Articleモデルのfindメソッドを最初に呼び出し、リクエストで言及されている
    # 記事のオブジェクトを取得して@articleに保存しています。
    @article = Article.find(params[:article_id])

    @comment = @article.comments.new
    # attributes でモデルの全てのカラムと属性を取得し、コメント入力欄の
    # 内容を入れる。
    @comment.attributes = comment_params
    @comment.user_id = current_user.id
    @comment.save!

    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])

    # @article.comments コレクションの中のどのコメントが対象であるかを特定して
    # @comment に保存します。
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private

    def comment_params
      params.require(:comment).permit(:body)
    end
end
