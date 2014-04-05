class LoginUsersController < ApplicationController
  # サインアップ
  def new
    @login_user = LoginUser.new
  end

  def create
    @login_user = LoginUser.new(params[:login_user_params])
  
    if @login_user.save
      redirect_to companies_path
    else
      render action: :new
    end
  end

  private 
  
    def login_user_params
      params.require(:login_user).permit(:name, :password)
    end

end
