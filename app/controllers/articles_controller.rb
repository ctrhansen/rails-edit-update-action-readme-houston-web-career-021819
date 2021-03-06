class ArticlesController < ApplicationController

  before_action :current_article, only: [:edit, :update] 

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new
    @article.title = params[:title]
    @article.description = params[:description]
    @article.save
    redirect_to article_path(@article)
  end

  # add edit and update methods here
  def edit
    
  end

  def update
    
    @article.update(article_params)
    redirect_to @article
  end

  private

  def article_params 
    params.require(:article).permit(:description, :title)
  end

  def current_article
    @article = Article.find(params[:id])
  end

end
