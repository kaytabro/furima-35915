class BuysController < ApplicationController

  def index
    @buy_add = BuyAdd.new
  end

  def create
    @buy_add = BuyAdd.new(buy_params)
    if @buy_add.valid?
      @buy_add.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_params
    params.require(:buy_add).permit(:post_number, :prefecture_id, :municipalities, :address, :building, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id)
  end
end
