class PurchasesController < ApplicationController
  before_action :set_merchandise

  def index
    # @purchase = @merchandise.purchases
    @purchase = @merchandise
  end

  private
  def set_merchandise
    @merchandise = Merchandise.find(params[:merchandise_id])
  end
end
