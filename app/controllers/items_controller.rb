class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :edit ]
  before_action :set_item, only: [ :show, :edit, :update, :destroy ] 
  before_action :move_to_index, only: [ :edit, :update ]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    if user_signed_in? && @item.user_id == current_user.id
      @item.destroy
      redirect_to root_path
    end
  end



  private

  def item_params
    params.require(:item).permit(:image, :name, :explain, :category_id, :status_id, :postage_id, :prefecture_id, :take_days_id,
                                 :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless current_user.id == Item.find(params[:id]).user_id
  end
  
end
