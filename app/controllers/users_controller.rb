class UsersController < ApplicationController

  # ユーザーを一覧表示する時はログインするようユーザーに要求する。
  before_action :authenticate_user!, only: [:index]

  def index
    @users = User.paginate(page: params[:page], :per_page => 10).order('username ASC')
  end

  def show
    @user = User.find(params[:id])
    article_ids = @user.comments.where(body: nil).distinct.pluck(:article_id)
    @articles = Article.where("id IN (?)", article_ids).paginate(page: params[:page], :per_page => 10)
  end
end
