class UsersController < ApplicationController
  
  def show
    #find(1)は後でfind(params[:id])に修正する
    @user = User.find(1)
  end

  def new
    render :new, layout: "second_layout"
  end

  def create
    render :create, layout: "second_layout"
  end
end
