class UsersController < ApplicationController
  def index
  end

  def new
    render :new, layout: "second_layout"
  end

  def create
    render :create, layout: "second_layout"
  end
  
  def logout
  end

end
