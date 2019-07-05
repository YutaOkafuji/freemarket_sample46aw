class CreditsController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = User.find(params[:user_id])
  end

  def new
    render :new, layout: "second_layout"
  end

  def create
    redirect_to sign_ups_path
  end

  def edit; end
end
