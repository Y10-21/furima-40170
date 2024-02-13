class PurchasesController < ApplicationController
  before_action :set_merchandise
  before_action :authenticate_user!, only: [:index]
  before_action :redirect_to_root_path, only: [:index]
  before_action :user_redirect, only: [:index]

  def index
    @merchandise
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_merchandise
    @merchandise = Merchandise.find(params[:merchandise_id])
  end

  def purchase_params
    params.require(:purchase_address).permit(:post_number, :prefecture_id, :post_city, :post_address, :post_building, :telephone_number).merge(user_id: current_user.id,merchandise_id: @merchandise.id,token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @merchandise[:price],
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def user_redirect
    if current_user.id == @merchandise.user.id
      redirect_to root_path
    end
  end
  def redirect_to_root_path
    if @merchandise.purchase
      redirect_to root_path
    end
  end
end