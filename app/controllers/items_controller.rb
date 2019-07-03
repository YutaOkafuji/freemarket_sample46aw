class ItemsController < ApplicationController
  
  def index
  end

  def show
    #find(1)は後でfind(params[:id])に修正する
    # @item = Item.find(1)
    render layout: "layout_items_show"
  end
  
  def new
    render layout: "second_layout"
    @item = Item.new
  end

  def create
    @item = Item.create(name: params_item[:name], price: params_item[:price], description: params_item[:description],
    sale_status: params_item[:sale_status], buy_status: params_item[:buy_status], user_id: current_user.id)
  end

  private

  def params_item
    params.permit(:name, :price, :description, :sale_status, :buy_status, :user_id)
  end
end
