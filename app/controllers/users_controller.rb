class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new] 
  before_action -> {
    set_user
    correct_user?(@user)
  }, only: %i[show]

  def new
    render :new, layout: "second_layout"
  end

  def show
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def correct_user?(user)
    redirect_to root_path, flash: { warning: '不正なアクセス' } unless current_user.id == user.id
  end
end
