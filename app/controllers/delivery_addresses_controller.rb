class DeliveryAddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:new, :create]

  def new
    @delivery_address = DeliveryAddress.new
    render :new, layout: "second_layout"
  end

  def create
    @user.delivery_address = DeliveryAddress.new(delivery_address_params)
    # TODO 単体テストを実装する必要がある
    if @user.delivery_address.save
      redirect_to new_user_credits_path(user_id: @user.id)
    else
      render action: :new
    end  
  end

  private 
  def delivery_address_params
    params.require(:delivery_address).permit(:zip_code, :prefecture_id, :city, :street_number, :building, :telephone)
  end

  def set_user
    @user = User.find(params[:user_id]) 
  end
end
