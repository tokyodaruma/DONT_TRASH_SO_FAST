class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def create
    @booking = Booking.new(booking_params)
    @surplus = Surplus.find(params[:surplus_id])
    @booking.surplus = @surplus
    if @booking.save
      redirect_to bookings_path
    else
      render 'surpluses/show'
    end
    authorize @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:date)
  end
end
