class StaticPagesController < ApplicationController

  def home
    @new_articles    = Article.order(id: :desc).limit(3)
    @randum_articles = Article.find(Article.pluck(:id).shuffle[0..2])
  end

  def help
  end

  def about
  end
end
