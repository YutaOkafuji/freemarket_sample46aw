class DeliveryAddressesController < ApplicationController
  before_action :authenticate_user!
  before_action -> { 
    set_user
    correct_user?(@user) 
  }, only: %i[new create edit update]
  before_action :set_profile, only: %i[edit update]
  before_action :set_delivery_address, only: %i[edit update]
  layout "second_layout", only: %i[new create]

  def new
    @user.build_delivery_address
  end

  def create
    if @user.update(user_profile_address_params)
      redirect_to new_user_credits_path(user_id: @user.id)
    else
      render :new and return
    end  
  end

  def edit; end

  def update
    if @user.update(user_profile_address_params)
      redirect_to edit_user_delivery_addresses_path(@user)
    else
      render :edit and return
    end
  end

  private 
  def user_profile_address_params
    params.require(:user).permit(
      profile_attributes: [:nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday],
      delivery_address_attributes: [:zip_code, :prefecture_id, :city, :street_number, :building, :telephone]
    )
  end

  def set_user
    @user = User.find(params[:user_id]) 
  end

  def set_delivery_address
    @delivery_address = DeliveryAddress.find(@user.delivery_address.id)
  end

  def set_profile
    @profile = Profile.find(@user.profile.id)
  end

  def correct_user?(user)
    redirect_to root_path, flash: { warning: '不正なアクセス' } unless current_user.id == user.id
  end
end
