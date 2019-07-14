class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  # before_action :set_item, except: %i[index new]
  # before_action :move_to_index, except: [:index, :show]
  
  def index
    @items = Item.all.includes(:item_images).order("created_at DESC")
  end

  def show
    # find(1)は後でfind(params[:id])に修正する
    @item = Item.find(1)
    render layout: "layout_items_show"
  end

  def new
    respond_to do |format|
      format.html
      format.json
    end

    @item = Item.new
    @item.item_images.build
    @item.build_item_detail
    @item.build_shipping_origin
    render layout: "second_layout"
  end

  def create
    @item = Item.new(item_params)
binding.pry
    if @item.save 
      redirect_to root_path
    else
      redirect_to new_item_path
    end
  end

  def edit

  end

  def update
    redirect_to root_path unless @item.user.id == current_user.id
    if @item.update(item_params)
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

  def item_params
    params.require(:item).permit(
      :name,
      :price,
      :description,
      :sale_status,
      :buy_status,
      item_images_attributes: %i[ id image ],
      item_detail_attributes: %i[ id condition_id ],
      shipping_origin_attributes: %i[ id prefecture_id burden_id delivery_date_id ])
      .merge(user_id: current_user.id)
  end
  
  # def set_item_new
  #   @item = Item.find(params[:id])
  # end

end
