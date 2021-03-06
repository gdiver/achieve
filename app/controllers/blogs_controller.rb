class BlogsController < ApplicationController
  before_action :set_blog, only: [:edit, :update, :destroy]
  
  def index
      @blogs = Blog.all
  end

  def new
    if params[:back]
      @blog = Blog.new(blogs_params)
    else
      @blog = Blog.new
    end
  end

  def create
    @blog = Blog.new(blogs_params)
    if @blog.save
      # 一覧画面へ遷移して「ブログを作成しました！」を表示
      redirect_to blogs_path, notice: "ブログを作成しました！"
    else
      # 入力画面を再描画
      render 'new'
    end
  end

  def edit
    # edit,update,destroyで共通化
    # @blog = Blog.find(params[:id])
  end

  def update
    # edit,update,destroyで共通化
    # @blog = Blog.find(params[:id])
    if @blog.update(blogs_params)
      # 一覧画面へ遷移して「ブログを更新しました！」を表示
      redirect_to blogs_path, notice: "ブログを更新しました！"
    else
      # 編集画面を再描画
      render 'edit'
    end
  end

  def destroy
    # edit,update,destroyで共通化
    # @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path, notice: "ブログを削除しました！"
  end

  def confirm
    @blog = Blog.new(blogs_params)
    render :new if @blog.invalid?
  end

  private
  # ↑ ストロングパラメータ　改ざん防止(指定パラメータ)･･･permit()　※ruby ver.4以降必須
    def blogs_params  #メソッド名はなんでも可
      params.require(:blog).permit(:title, :content, :id)
      # pramas:箱、require:入っているか、permit:許可
    end
    
    # idをキーとして値を取得
    def set_blog
      @blog = Blog.find(params[:id])
    end
end
