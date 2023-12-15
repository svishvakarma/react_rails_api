class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]

  def index
    @articles = Article.all
  end

  def create
    @article = Article.new(article_params)
      if @article.save
        render json: @article 
      else
        render json: @article.errors, status: :unprocessable_entity
      end
  end

  def destroy
    @article.destroy
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      byebug
      params.require(:article).permit(:title, :body, :point)
    end
end
