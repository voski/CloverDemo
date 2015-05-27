class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    client = OAuth2::Client.new(
      'VTEQFHAVMJ5FP',
      '1f51d805-6f92-2101-663c-0f5513654feb',
      :site => 'https://clover.com/',
      :token_method  => :get
    )
    oauth_endpoint = client.auth_code.authorize_url(:redirect_uri => "#{users_url current_user}") 
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)
      render json: current_user
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:password, :username)
  end
end
