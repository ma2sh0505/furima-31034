class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.all
  end

  def create
    @item = Item.new
  end

end
