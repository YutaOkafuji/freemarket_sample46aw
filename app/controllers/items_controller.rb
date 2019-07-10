class ItemsController < ApplicationController
  # before_action :set_item, except: %i[index new　create]
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
    @item = Item.new
    @item.item_images.build
    # @item.item_detail.build
    # @item.shipping_origin.build
    render layout: "second_layout"
  end

  def create
    @item = Item.new(item_params)
    # @item.item_image = ItemImage.new(item_image_params)
    # @item.item_detail = ItemDetail.new(item_detail_params)
    # @item.shipping_origin = ShippingOrigin.new(shipping_origin_params)
    binding.pry
    if @item.save 
      # && @item.images.save && @item.detail.save && @item.shipping.save
      redirect_to root_path
    else
      redirect_to new_item_path
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
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :description, :sale_status, :buy_status,
                                  item_image_attributes: %i[url item_id],
                                  item_detail_attributes: %i[size brand condition item_id],
                                  shipping_origin_attributes: %i[origin_region shipping_day shipping_method shipping_burden item_id)])
    # .marge(user_id: current_user.id)
  end
  
  # def set_item_new
  #   @item = Item.find(params[:id])
  # end

end
