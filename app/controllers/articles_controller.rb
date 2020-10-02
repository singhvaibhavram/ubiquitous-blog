class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    #render plain: params[:article].inspect
    @artcile = Article.new(article_params)
    @artcile.save
    redirect_to article_show(@artcile)
  end

  private
    def article_params
      params.require(:article).permit(:title, :description)
    end
end
