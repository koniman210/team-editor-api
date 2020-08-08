class V1::ArticlesController < V1::BaseApiController
  def index
    articles = Article.all
    render json: articles
  end

  def show
    article = Article.find(params[:id])
    render json: article
  end

  def create
    article = current_user.articles.create!(article_params)
    render json: article
  end

  def update
    article = Article.find(params[:id])
    article.update!(article_params)
    render json: article
  end

  
  private

    def article_params
      params.require(:article).permit(:title, :content)
    end
end
