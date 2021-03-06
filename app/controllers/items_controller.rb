class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :redirect_to_index, only: [:edit, :update, :destroy]

  def index
    @item = Item.all.order(created_at: :desc)
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to action: :index
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def redirect_to_index
    redirect_to action: :index if @item.purchase_record.present? || current_user != @item.user
  end

  def item_params
    params.require(:item).permit(:image, :name, :item_description, :category_id, :condition_id, :shipping_cost_id, :area_id,
                                 :shipping_time_id, :price).merge(user_id: current_user.id)
  end
end
