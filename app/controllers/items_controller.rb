class ItemsController < ApplicationController
  def index
  end

  def new
    @merchandise = Merchandise.new
  end
end
