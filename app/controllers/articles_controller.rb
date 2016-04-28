class ArticlesController < ApplicationController

  before_action :set_article, only: [:edit, :update, :show, :destroy]

	def index
		@articles = Article.all
	end
  
	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
    @article.user = User.first
		if @article.save
			flash[:notice] = 'Article was sucessfully created'
			redirect_to article_path(@article)
		else
			render 'new'
		end
		# @article = Article.new(article_params)
		# @article.save
		# redirect_to article_show(@article)
	end

	def edit
		# @article = Article.find(params[:id])
	end

	def update 
		# @article = Article id(params[:id])
		if @article.update(article_params)
			flash[:notice] = 'Article was sucessfully updated'
			redirect_to article_path(@article)
		else
			render 'edit'
		end
	end

  def destroy
    @article.destroy
    flash[:notice] = "Article was sucessfully deleted"
    redirect_to articles_path
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end

	private 
	def article_params
		params.require(:article).permit(:title, :description)
	end



end