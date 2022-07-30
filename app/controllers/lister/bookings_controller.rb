class Lister::BookingsController < ApplicationController
  before_action :find_bookings, only: %i[show]

  def index
    @bookings = policy_scope [:lister, Booking]
  end

  def update
    @booking = Booking.find(params[:id])
    authorize [:lister, @booking]
    if @booking.update(booking_params)
      # redirect_to # up to you...
    else
      # render # where was the booking update form?
    end
  end

  def show

  end


  private

  def find_bookings
    @bookings.where(user_id params[user_id])
  end

  def booking_params
    # TODO: check your model, might be different than mine
    params.require(:booking).permit(:status)
  end
end
