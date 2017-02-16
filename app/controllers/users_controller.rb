class UsersController < ApplicationController
  before_action :authorize_user, only: [:new]

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      login!(user)
      redirect_to (cats_url)
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end