class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, except: %i[index new]
  # before_action :move_to_index, except: [:index, :show
  
  def index
    @items = Item.includes(:item_images).order("created_at DESC")
  end

  def show
    @like = Like.where(user_id: @item.user_id).count
    render layout: "layout_items_show"
  end

  def new
    render layout: "second_layout"
  end

  def edit

  end

  def update
    redirect_to root_path unless @item.user.id == current_user.id
    if @item.update(update_item_params)
      redirect_to item_path(@item)
    else
      render redirect_to item_path(@itema)
    end
  end

  def destroy
    if current_user.id == @item.user_id
      if @item.destroy
        redirect_to root_path, flash: { success: '削除しました' }
      else
        redirect_to root_path, flash: { warning: '削除に失敗しました' }
      end
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def update_item_params
    params.require(:item).permit( :name,
                                  :description,
                                  :price,
                                  item_image_attributes: %i[id url],
                                  item_details_attributes: %i[id size brand condition])
  end
end
