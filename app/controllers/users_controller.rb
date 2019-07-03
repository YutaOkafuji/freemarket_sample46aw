class UsersController < ApplicationController
  def index
  end

  def new
    render :new, layout: "second_layout"
  end

  def create
    @user = User.create(user_params)
    @user.profile = Profile.create(profile_params)
    render :create, layout: "second_layout"
  end
  
  def logout
  end

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
    birthday= Time.new(birthday[0], birthday[1], birthday[2])
    birthday.strftime("%Y%m%d")
  end
end
