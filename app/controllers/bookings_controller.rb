class BookingsController < ApplicationController

  def index
    @bookings = policy_scope(lister ,Booking).order(created_at: :desc)
  authorize([:lister, @booking])
  end

  def create
    @surplus = Surplus.find(params[:surplus_id])
    @booking = Booking.new(booking_params)
    @booking.surplus = @surplus
    @booking.user = current_user
    @booking.status = 'pending'
    if @booking.save
      redirect_to bookings_path
    else
      render 'surpluses/show'
    end
    authorize @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :status)
  end
end
