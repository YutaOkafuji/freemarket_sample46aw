class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
  end

  def show
    #find(1)は後でfind(params[:id])に修正する
    # @item = Item.find(1)
    render layout: "layout_items_show"
  end
  
  def new
    render layout: "second_layout"
  end

end
