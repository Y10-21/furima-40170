module MerchandisesHelper
  def index
  end

  def new
    @merchandise = Merchandise.new
  end

  def create
    @merchandise = Merchandise.create(merchandise_params)
    redirect_to '/'
  end

  private

  def merchandise_params
    params.require(:merchandise).permit(:name, :image, :explanation, :category_id, :condition_id, :shipping_load_id, :prefecture_id, :shipping_day_id, :price).merge( user_id: current_user.id )
  end
end
