class BlogsController < ApplicationController
  before_action :authenticate_user!, except: [:index]  # deviseのメソッドで「ログインしていないユーザーをログイン画面に送る」メソッド

  def new
    @blog = Blog.new # 新規投稿用の空のインスタンス
  end

  def create
    @blog = Blog.new(blog_params)  # フォームから送られてきたデータ(body)をストロングパラメータを経由して@tweetに代入
    @blog.user_id = current_user.id # user_idの情報はフォームからはきていないので、deviseのメソッドを使って「ログインしている自分のid」を代入
    @blog.save
    redirect_to blogs_path
  end

  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
    @user = @blog.user
  end

  private
    def blog_params
      params.require(:blog).permit(:title, :body)
    end
end
