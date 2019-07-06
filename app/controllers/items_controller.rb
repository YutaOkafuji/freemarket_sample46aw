class ItemsController < ApplicationController
  before_action :set_item, except: %i[index new]
  # before_action :move_to_index, except: [:index, :show]
  def index
    #find(1)は後でfind(params[:id])に修正する
    @item = Item.find(1)
    @items = Item.all.includes(:item_images).order("created_at DESC")
  end

  def show
    #find(1)は後でfind(params[:id])に修正する
    @item = Item.find(1)
    render layout: "layout_items_show"
  end
  
  def new
    render layout: "second_layout"
  end

  def destroy
  if  current_user.id == @item.user_id
    if @item.destroy
      redirect_to root_path, flash:{ success: '削除しました'}
    else
      redirect_to root_path, flash:{ warning: '削除に失敗しました' }
    end
  end

  end

  private 

  def set_item
    @item = Item.find(params[:id])
  end

end
