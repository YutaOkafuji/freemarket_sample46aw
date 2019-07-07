class UserAddressesController < ApplicationController
  before_action :authenticate_user!
  def new
    @user = User.find(params[:user_id])
    render :new, layout: "second_layout"
  end

  def edit
  end

  def create
    @user = User.find(params[:user_id])
    @user.user_address = UserAddress.new(user_address_params)
    if @user.user_address.save
      redirect_to new_user_credit_path(user_id: @user.id)
    else
      render action: :new
    end  
  end

  private 
  def user_address_params
    params.permit(:zip_code, :prefecture_id, :city, :street_number, :building)
  end

  def get_user
    @user = User.find(params[:user_id])
  end
end
