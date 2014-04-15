class LoginUsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]

  def new
    @login_user = LoginUser.new(params[:login_user])
  end

  def create
    @login_user = LoginUser.new(login_user_params)
    if @login_user.save
      flash[:notice] = "Account registered!"
      redirect_back_or_default account_url
    else
      render action: 'new'
    end
  end

  def show
    @login_user = @current_user
  end

  def edit
    @login_user = @current_user
  end

  def update
    @login_user = @current_user # makes our views "cleaner" and more consistent
    if @login_user.update_attributes(login_user_params)
      flash[:notice] = "Account updated!"
      redirect_to account_url
    else
      render action: 'edit'
    end
  end

  private
    def login_user_params
      params.require(:login_user).permit(:login, :password, :password_confirmation)
    end
end
