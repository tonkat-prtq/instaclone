class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id) # GETメソッドの時,user_pathでshowアクション発火、その際引数としてユーザのIDをもたせる必要がある
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user.image.cache! unless @user.image.blank? # 既に画像が存在する場合にキャッシュを作成する
  end

  def update
    if params[:back]
      render :edit
    else
      if @user.update(user_params)
        redirect_to user_path(@user.id), notice: "プロフィールを編集しました" # showアクション発火させ詳細画面に飛ばす
      else
        render :edit
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
  end
end
