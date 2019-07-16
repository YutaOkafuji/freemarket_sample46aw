class DeliveryAddressesController < ApplicationController
  before_action :authenticate_user!
  before_action -> { 
    set_user
    correct_user?(@user) 
  }, only: %i[new create edit update]
  before_action :set_delivery_address, only: %i[edit update]
  layout "second_layout", only: %i[new create]

  def new
    @delivery_address = DeliveryAddress.new
  end

  def create
    @delivery_address = DeliveryAddress.new(delivery_address_params)
    # TODO 単体テストを実装する必要がある
    if @delivery_address.save
      redirect_to new_user_credits_path(user_id: @user.id)
    else
      render :new and return
    end  
  end

  def edit
  end

  def update
    if @delivery_address.update(delivery_address_params)
      redirect_to edit_user_delivery_addresses_path(@user)
    else
      render :edit and return
    end
  end

  private 
  def delivery_address_params
    params.require(:delivery_address).permit(:zip_code, :prefecture_id, :city, :street_number, :building, :telephone).merge(user_id: current_user.id)
  end

  def set_user
    @user = User.find(params[:user_id]) 
  end

  def set_delivery_address
    @delivery_address = DeliveryAddress.find(@user.delivery_address.id)
  end

  def correct_user?(user)
    redirect_to root_path, flash: { warning: '不正なアクセス' } unless current_user.id == user.id
  end
end
