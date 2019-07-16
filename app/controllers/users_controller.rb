class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new] 
  before_action :set_user, only: [:show]

  def show
    if @user.profile.nil?
      # ToDo もう一度情報を入力されるように促す。
      sign_out(@user)
      redirect_to new_user_registration_path(id: @user.id)
    end
  end

  def new
    render :new, layout: "second_layout"
  end

  def index
    render :new, layout: "second_layout"
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
