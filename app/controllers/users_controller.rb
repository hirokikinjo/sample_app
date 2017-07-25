class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  # ユーザー登録処理
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "ユーザー登録が完了しました！ならゆんへようこそ～"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  private
    
    # ユーザーパラメーターの設定
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
