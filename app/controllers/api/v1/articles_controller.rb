module Api::V1
  class ArticlesController < BaseApiController
    before_action :authenticate_user!
    def index
      articles = current_user.articles.draft.order(updated_at: :desc)
      render json: articles, each_serializer: Api::V1::ArticlePreviewSerializer
    end
    def show
      article = current_user.articles.draft.find(params[:id])
      render json: article, serializer: Api::V1::ArticleSerializer
    end
    def create
      article = current_user.articles.create!(article_params)
      render json: article
    end
    def update
      article = current_user.articles.find(params[:id])
      article.update!(article_params)
      render json: article
    end
    def destroy
      article = current_user.articles.find(params[:id])
      article.destroy!
    end
    private
      def article_params
        params.require(:article).permit(:title, :body, :status)
      end
  end
end
