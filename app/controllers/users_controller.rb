class UsersController < ApplicationController

  # ユーザーを一覧表示する時はログインするようユーザーに要求する。
  before_action :authenticate_user!, only: [:index]

  def index
    @users = User.paginate(page: params[:page], :per_page => 10)
  end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles.paginate(page: params[:page], :per_page => 10)
  end
end
