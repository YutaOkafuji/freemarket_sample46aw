class UserAddressesController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]
  def new
    render :new, layout: "second_layout"
  end

  def edit
  end
end
