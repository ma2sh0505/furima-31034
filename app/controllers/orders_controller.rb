class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index,:create]

  def index
    @order_address = OrderAddress.new
    if current_user == @item.user || @item.nil? ==  @item.order.nil?
      redirect_to root_path
    end
  end

  def create
    @order_address = OrderAddress.new(order_params)
      if @order_address.valid?
        credit_key
        @order_address.save
        redirect_to root_path
      else
        render action: :index
      end
  end

  private
    def order_params
      params.require(:order_address).permit(:post_code, :prefecture_id, :city, :house_number, :building_number, :phon_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
    end

    def set_item
      @item = Item.find(params[:item_id])
    end

    def  credit_key
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
    end
end
