class SurplusesController < ApplicationController
  before_action :find_surplus, only: %i[show]

  def index
    @surpluses = policy_scope(Surplus).order(created_at: :desc)
    if params[:query].present?
      @surpluses = Surplus.search_by_name_and_location_and_quantity(params[:query])
    else
      @surpluses.all
    end
  end

  def show
    @markers = [
      lat: @surplus.latitude,
      lng: @surplus.longitude
    ]
    @booking = Booking.new
    authorize @surplus
  end

  def new
    @surplus = Surplus.new
    authorize @surplus
  end

  def create
    @surplus = Surplus.new(surplus_params)
    @surplus.user = current_user
    authorize @surplus

    if @surplus.save
      redirect_to surplus_path(@surplus)
    else
      render :new
    end
  end

  private

  def find_surplus
    @surplus = Surplus.find(params[:id])
  end

  def surplus_params
    params.require(:surplus).permit(:photo, :category, :description, :location, :quantity)
  end
end
