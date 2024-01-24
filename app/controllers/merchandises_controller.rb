class MerchandisesController < ApplicationController
  def index
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

  private

  def merchandise_params
    params.require(:merchandise).permit(:name, :image, :explanation, :category_id, :condition_id, :shipping_load_id, :prefecture_id, :shipping_day_id, :price).merge( user_id: current_user.id )
  end
end
