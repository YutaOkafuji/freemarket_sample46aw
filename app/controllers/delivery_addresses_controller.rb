class DeliveryAddressesController < ApplicationController
  before_action :authenticate_user!
  def new
    get_user
    render :new, layout: "second_layout"
  end

  def create
    get_user
    @user.delivery_address = DeliveryAddress.new(delivery_address_params)
    if @user.delivery_address.save
      redirect_to new_user_credit_path(user_id: @user.id)
    else
      render action: :new
    end  
  end

  private 
  def delivery_address_params
    params.permit(:zip_code, :prefecture_id, :city, :street_number, :building, :telephone)
  end

  def get_user
    @user = User.find(params[:user_id]) 
  end
end
