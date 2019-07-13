class CreditsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show]
  
  def show
  end

  def new
    # TODO Payjpで実装できたら実装する
    render :new, layout: "second_layout"
  end

  def create
    # TODO Payjpで実装できたら実装する
    redirect_to user_members_path
  end

  def edit
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end 
end
