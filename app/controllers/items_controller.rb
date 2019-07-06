class ItemsController < ApplicationController
  before_action :set_item, except: %i[index new]
  # before_action :move_to_index, except: [:index, :show]
  def index
    @items = Item.all.includes(:item_images).order("created_at DESC")
  end

  def show
    #find(1)は後でfind(params[:id])に修正する
    @item = Item.find(1)
    render layout: "layout_items_show"
  end
  
  def new
    render layout: "second_layout"
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.images = ItemImage.new(item_image_params)
    @item.detail = ItemDetail.new(item_detail_params)
    @item.shipping = ShippingOrigin.new(shipping_origin_params)

    if @item.save && @item.images.save && @item.detail.save && @item.shipping.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    if  current_user.id == @item.user_id
      if @item.destroy
        redirect_to root_path, flash:{ success: '削除しました'}
      else
        redirect_to root_path, flash:{ warning: '削除に失敗しました' }
      end
    end

  private

  def item_params
    params.permit(:name, :price, :description, :sale_status, :buy_status).marge(user_id: current_user.id)
  end

  def item_image_params
    params.permit(:url, :item_id)
  end

  def item_detail_params
    params.permit(:size, :brand, :condition, :item_id)
  end

  def shipping_origin_params
    params.permit(:origin_region, :shipping_day, :shipping_method, :shipping_burden,:item_id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
  
end
