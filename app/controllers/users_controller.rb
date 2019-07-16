class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new] 
  before_action :set_user, only: [:show]

  def show
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
