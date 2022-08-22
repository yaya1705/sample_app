class ListsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @list = List.new
  end

  def create
     # １.&2. データを受け取り新規登録するためのインスタンス作成
    @list = List.new(list_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    if @list.save
     # 4. 詳細画面へリダイレクト
      redirect_to list_path(list.id)
    else
     # render :アクション名で、同じコントローラ内の別アクションのViewを表示
      render :new
    end
    # 上記のrender :newの部分でredirect_toを使うとnewアクション内で再度 @list = List.newが実行され,
    # @listが上書きされてエラーメッセージが消えてしまいます。
    # 基本的には、エラーメッセージを扱う際にはrender、それ以外はredirect_toを使うと覚えておきましょう。
  end

  def index
    @lists = List.all
  end

  def show
    #/lists/1  => List.find(params[:id]) => idが1のレコードを取得
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end

  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to lists_path
  end
  private
  # ストロングパラメータ

  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
end
