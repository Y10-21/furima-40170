class MerchandisesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @merchandises = Merchandise.order('created_at DESC')
  end

  def new
    @merchandise = Merchandise.new
  end

  def create
    @merchandise = Merchandise.create(merchandise_params)
    if @merchandise.save
      redirect_to '/'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @merchandise = Merchandise.find(params[:id])
  end

  def edit
    @merchandise = Merchandise.find(params[:id])
    if user_signed_in? && @merchandise.user == current_user
      @merchandise
    else
      redirect_to root_path
    end
  end

  def update
    @merchandise = Merchandise.find(params[:id])
    if @merchandise.update(merchandise_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def merchandise_params
    params.require(:merchandise).permit(:name, :image, :explanation, :category_id, :condition_id, :shipping_load_id,
                                        :prefecture_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end
end
