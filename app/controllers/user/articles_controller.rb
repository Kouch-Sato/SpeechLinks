class User::ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to user_articles_path
    else 
      render :new
    end
  end

  def show
  end

  def index
    @articles = Article.all
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def article_params
    params.require(:article).permit(:title, :content)
  end
end
