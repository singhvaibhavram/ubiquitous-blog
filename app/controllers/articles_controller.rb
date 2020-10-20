class ArticlesController < ApplicationController
  before_action :set_params, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  # New Article
  def new
    @article = Article.new
  end

  # Article Listing
  def index
    @articles = Article.all
  end

  # On New Article Submit
  def create
    #render plain: params[:article].inspect
    @article = Article.new(article_params)
    # Hardcoded User for the time being
    @article.user = User.first
    # Saving Article to Database
    if @article.save
      flash[:success] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  # Edit Article
  def edit
  end

  # On Edit Article Submit
  def update
    # Updating in Database
    # Hardcoded User for the time being
    @article.user = User.first
    if @article.update(article_params)
      flash[:success] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def show
  end

  # Deleting the Article
  def destroy
    @article.destroy
    flash[:danger] = "Article was successfully deleted"
    redirect_to articles_path
  end

  private
    def set_params
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :description)
    end

    def require_same_user
      if current_user != @article.user
        flash[:danger] = "You can only edit or delete your own articles."
        redirect_to root_path
      end
    end
end
