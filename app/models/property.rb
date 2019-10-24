# frozen_string_literal: true

require 'active_record'

class Property < ActiveRecord::Base
  belongs_to :user
  has_many :bookings

  def find_bookings
    Booking.where(property_id: id, booking_status: 'pending').or(Booking.where(property_id: id, booking_status: 'confirmed')).reverse_order
  end

  def dates_booked
    bookings = Booking.where(property_id: id, booking_status: 'confirmed')
    dates = []
    bookings.each do |booking|
      (booking.check_in..booking.check_out).each do |date|
        dates << date.strftime("%F")
      end
    end
    dates
  end
  
end
