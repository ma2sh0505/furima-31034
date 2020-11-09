class OrdersController < ApplicationController

  def index
  end

  def create
    @order_address = OrderAddress.new(order_params)
      if @order_address.valid?
        @order_address.save
        redirect_to action: :index
      else
        render action: :new
      end
  end

  private
    def order_params
      params.require(:order_address).permit(:post_code, :prefecture_id, :city, :house_number, :building_number, :phon_number)
    end
end
