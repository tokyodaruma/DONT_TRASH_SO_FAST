class Lister::BookingsController < ApplicationController
  before_action :find_bookings, only: %i[show]

  def index
    @bookings = Booking.all
    @bookings = policy_scope [:lister, Booking]
  end

  def update

  end

  def show

  end


  private

  def find_bookings
    @bookings.where(user_id params[user_id])

  end
end
