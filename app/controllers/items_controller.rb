class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.all
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def item_params
    params.require(:item).permit(:name,:introduction,:category_id,:condition_id,:price,:delivery_area_id,:delivery_burden_id,:delivery_day_id,:image).merge(user_id: current_user.id)
  end
end
