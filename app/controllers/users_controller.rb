class UsersController < ApplicationController
  def index
  end

  def new
    render :new, layout: "second_layout"
  end

end
