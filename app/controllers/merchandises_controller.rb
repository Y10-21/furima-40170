class MerchandisesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :destroy]
  before_action :set_merchandise, except: [:index, :new, :create]
  before_action :redirect_to_root_path, only: [:edit]
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
  end

  def edit
    if @merchandise.user == current_user
      @merchandise
    else
      redirect_to root_path
    end
  end

  def update
    if @merchandise.update(merchandise_params)
      redirect_to @merchandise
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @merchandise.user == current_user
      @merchandise.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def merchandise_params
    params.require(:merchandise).permit(:name, :image, :explanation, :category_id, :condition_id, :shipping_load_id,
                                        :prefecture_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end

  def set_merchandise
    @merchandise = Merchandise.find(params[:id])
  end

  def redirect_to_root_path
    return unless @merchandise.purchase

    redirect_to root_path
  end
end
