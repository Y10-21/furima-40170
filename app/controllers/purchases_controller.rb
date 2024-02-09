class PurchasesController < ApplicationController
  before_action :set_merchandise

  def index
    @merchandise
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_merchandise
    @merchandise = Merchandise.find(params[:merchandise_id])
  end

  def purchase_params
    params.require(:purchase_address).permit(:post_number, :prefecture_id, :post_city, :post_address, :post_building, :telephone_number).merge(user_id: current_user.id,merchandise_id: @merchandise.id)
  end
end
