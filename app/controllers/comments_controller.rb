class CommentsController < ApplicationController

  def create
    # Articleモデルのfindメソッドを最初に呼び出し、リクエストで言及されている
    # 記事のオブジェクトを取得して@articleに保存しています。
    @article = Article.find(params[:article_id])

    # createメソッドを実行することで、コメントの作成と保存を同時に行っています。
    @comment = @article.comments.create(comment_params)
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
      params.require(:comment).permit(:commenter, :body)
    end
end
