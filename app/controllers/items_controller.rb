class ItemsController < ApplicationController
  def index
  end
  
  def new
    render :layout => "second_layout"
  end

end
