class SurplusesController < ApplicationController

  def index
    @surplus = Surplus.all
  end

  # show

  def new
    @surplus = Surplus.new
  end

  def create
    @surplus = Surplus.new(surplus_params)
    @surplus.user = current_user
    if @surplus.save
      redirect_to surplus_path(@surplus)
    else
      render :new
    end
  end
  private

  def surplus_params
    params.require(:surplus).permit(:photo, :category, :description, :location, :quantity)
  end
end
