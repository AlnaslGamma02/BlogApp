class ArticlesController < ApplicationController

  # 記事の閲覧以外はログインするようユーザーに要求する。
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :regular_user,       only: [:edit, :update, :destroy]

  def index
    @articles = Article.paginate(page: params[:page], :per_page => 10)
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @user    = User.find(current_user.id)
    @article = @user.articles.create(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private
    # ストロングパラメータ
    def article_params
      params.require(:article).permit(:title, :text, :picture)
    end

    # 正規ユーザーか確認
    def regular_user
      # 記事のIDから投稿者を特定
      user_id = Comment.find_by(article_id: params[:id]).user_id
      @user   = User.find(user_id)
      # 投稿者とログイン中のユーザーが合致しなければリダイレクト
      unless @user == current_user
        flash[:alert] = '編集および削除は投稿者の方のみご利用になれます。'
        redirect_back fallback_location: root_url
      end
    end
end
