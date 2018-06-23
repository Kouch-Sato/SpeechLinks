class User::ArticlesController < ApplicationController
  before_action :authenticate_user!

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to user_articles_path, notice: "記事を作成しました。"
    else 
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      @article.save
      redirect_to user_article_path(@article), notice: "記事を更新しました"
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to user_articles_path, notice: "記事を削除しました。"
  end

  private
  def article_params
    params.require(:article).permit(:title, :content)
  end
end
