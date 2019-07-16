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
    correct_user?(@user)
    if @user.profile.nil?
      # ToDo もう一度情報を入力されるように促す。
      sign_out(@user)
      redirect_to new_user_registration_path(id: @user.id)
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def correct_user?(user)
    redirect_to root_path, flash: { warning: '不正なアクセス' } unless current_user.id == user.id
  end
end
