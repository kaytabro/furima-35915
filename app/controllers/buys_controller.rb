class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_top, only: [:index]
  before_action :set_item

  def index
    @buy_add = BuyAdd.new
  end

  def create
    @buy_add = BuyAdd.new(buy_params)
    if @buy_add.valid?
      pay_action
      @buy_add.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def move_to_top
    item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == item.user_id || item.buy.present?
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def buy_params
    params.require(:buy_add).permit(:post_number, :prefecture_id, :municipalities, :address, :building, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token], price: params[:price])
  end

  def pay_action
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # ←必ず環境変数にする(APIの鍵情報は公開してはいけない)
    Payjp::Charge.create(
      amount: buy_params[:price], card: buy_params[:token], currency: 'jpy'
    )
  end

end
