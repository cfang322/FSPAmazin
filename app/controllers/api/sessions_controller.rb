class Api::SessionsController < ApplicationController
  def show
    @user = current_user
    if @user
      render json: @user
    else
      render json: { user: nil }
    end 
  end

  def create
    credential = params[:credential]
    password = params[:password]
    @user = User.find_by_credentials(credential, password)

    if @user
      login!(@user)
      render json: @user
    else
      render json: { errors: ['credentials invalid!'] }, status: :unauthorized 
    end 
  end

  def destroy
    if current_user
      logout!
      render json: { message: 'success' }
    end
  end
end
