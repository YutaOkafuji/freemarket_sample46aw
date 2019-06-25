class ItemsController < ApplicationController
  
  def index
  end

  def show
    render layout: "layout_items_show"
  end
  
  def new
    render layout: "second_layout"
  end

end
