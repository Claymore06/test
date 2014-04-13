class LoginUsersController < ApplicationController
  #before_filter :require_no_user, :only => [:new, :create]
  #before_filter :require_user, :only => [:show, :edit, :update]
  def new
    @login_user = LoginUser.new
  end
  
  def create
    @login_user = LoginUser.new(login_user_params)
    if @login_user.save
      flash[:notice] = "アカウントを登録しました。"
      redirect_to login_users_path
    else
      render action: 'new'
    end
  end

  def show
    @login_user = @current_user
  end

  def update
    @login_user = @current_user
    if @login_user.update_attributes(params[:login_user])
      flash[:notice] = "アカウント情報を更新しました。"
      redirect_to account_url
    else
      render action: 'edit'
    end
  end

  private

  def login_user_params
    params.require(:login_user).permit(:login, :email, :password, :password_confirmation, :role_ids)
  end
end
