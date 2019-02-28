class ArticlesController < ApplicationController

  # 記事の閲覧以外はログインするようユーザーに要求する。
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]

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
    # @article = current_user.articles.build(article_params)

    @user = current_user
    @article = @user.articles.new(article_params)

    # @article = current_user.articles.new(article_params)

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

    def article_params
      params.require(:article).permit(:title, :text, :picture)
    end
end
