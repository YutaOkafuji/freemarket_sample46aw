class LogoutsController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:user_id])
  end
end
