module Api
  module V1
    class ArticlesController < ApplicationController

      # http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
      
      def index
        @articles = Article.all
        render json: ArticleSerializer.new(@articles).serialized_json
      end
    
      def show
        @article = Article.find(params[:id])
        render json: ArticleSerializer.new(@article).serialized_json
      end
    
      def new
        @article = Article.new
        render json: ArticleSerializer.new(@article).serialized_json
      end
    
      def create
        @article = Article.new(article_params)
    
        if @article.save
          render json: ArticleSerializer.new(@article).serialized_json, status: :created
        else
          render json: ArticleSerializer.new(@article).serialized_json.errors, status: :unprocessable_entity
        end
      end
    
      def edit
        @article = Article.find(params[:id])
        render json: ArticleSerializer.new(@article).serialized_json
      end
    
      def update
        @article = Article.find(params[:id])
    
        if @article.update(article_params)
          render json: ArticleSerializer.new(@article).serialized_json, status: :updated
        else
          render json: ArticleSerializer.new(@article).serialized_json.errors, status: :unprocessable_entity
        end
      end
    
      def destroy
        @article = Article.find(params[:id])
        @article.destroy
    
        redirect_to root_path, status: :see_other
        render json: ArticleSerializer.new(@article).serialized_json
      end
    
    
      # private
      #   def article_params
      #     params.require(:article).permit(:title, :body)
      #   end
      private
        def article_params
          params.require(:article).permit(:title, :body, :status)
        end
    end
  end
end    