# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  layout "second_layout"
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  #GET /resource/sign_up
  def new
    # super
  end

  # POST /resource
  def create
    @user = User.new(user_params)
    @user.profile = Profile.new(profile_params)
    if @user.save && @user.profile.save
      sign_in(:user, @user)
      redirect_to new_user_delivery_addresses_path(user_id: @user.id)
    else
      # TODO バリデーションのエラーメッセージを飛ぶようにする。
      @user.destroy
      render action: :new
    end
      # super
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  
  private
  def user_params
    params.permit(:email, :password, :password_confirmation).merge( {avatar: nil, profit: 0, point: 0 } )
  end
  
  def profile_params
    params.permit(:nickname, :family_name, :first_name, :family_name_kana, :first_name_kana).merge( { birthday: get_birthday } )
  end
  
  def get_birthday
    birthday = params.permit(:birth_date)
    birthday = birthday.values
    unless birthday.include?("") 
      birthday= Time.new(birthday[0], birthday[1], birthday[2])
      birthday.strftime("%Y%m%d")
    else
      nil
    end
  end
end
