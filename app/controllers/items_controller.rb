class ItemsController < ApplicationController
  
  def index
    #find(1)は後でfind(params[:id])に修正する
    # @item = Item.find(1)
    @items = Item.all.includes(:item_images).order("created_at DESC")
  end

  def show
    #find(1)は後でfind(params[:id])に修正する
    @item = Item.find(1)
    # binding.pry
    # @item = set_item
    render layout: "layout_items_show"
  end
  
  def new
    render layout: "second_layout"
  end

  private 

  def set_item
    Item.find(params[:id])
  end

end
