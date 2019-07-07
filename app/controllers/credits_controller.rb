class CreditsController < ApplicationController
  before_action :authenticate_user!
  def show
    get_user
  end

  def new
    render :new, layout: "second_layout"
  end

  def create
    redirect_to user_members_path
  end

  def edit; end

  private
  def get_user
    @user = User.find(params[:user_id])
  end 
end
