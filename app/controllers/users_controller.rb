class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  skip_before_action :login_required, only: [:new, :create]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id) # GETメソッドの時,user_pathでshowアクション発火、その際引数としてユーザのIDをもたせる必要がある
    else
      render 'new'
    end
  end

  def show
    
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
    params.require(:user).permit(:id, :name, :email, :password, :password_confirmation, :image, :image_cache)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
