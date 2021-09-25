class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    authenticate_user!
    @item = Item.new
  end


end
