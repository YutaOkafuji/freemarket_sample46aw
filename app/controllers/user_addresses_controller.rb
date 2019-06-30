class UserAddressesController < ApplicationController
  def new
    render :new, layout: "second_layout"
  end

  def edit
    #find(1)は後でfind(params[:id])に修正する
    @user = User.find(1)
  end
end
