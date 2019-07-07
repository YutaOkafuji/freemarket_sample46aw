class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @items = Item.all.includes(:item_images).order("created_at DESC")
  end

  def show
    render layout: "layout_items_show"
  end
  
  def new
    render layout: "second_layout"
  end
end
