class MembersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    render :show, layout: "second_layout"
  end
end
