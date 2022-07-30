class BookingsController < ApplicationController

  def index
    @bookings = policy_scope([:lister, Booking]).order(created_at: :desc)
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

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to bookings_path

    else
      render 'bookings/index'# where was the booking update form?
    end
  end

  private

  def booking_params
    # TODO: check your model, might be different than mine
    params.require(:booking).permit(:date, :status)
  end
end
