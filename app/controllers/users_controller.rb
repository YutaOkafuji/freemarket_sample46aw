class UsersController < ApplicationController
  
  def show
    #find(1)は後でfind(params[:id])に修正する
    @user = User.find(1)
  end
end
