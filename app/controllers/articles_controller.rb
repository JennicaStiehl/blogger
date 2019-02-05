#app/controllers/articles_controller.rb
class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  # private
  #
  # def article_params
  #   params.require(:article).permit(:title)
  # end

end
