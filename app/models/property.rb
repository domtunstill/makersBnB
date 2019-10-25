# frozen_string_literal: true

require 'active_record'

class Property < ActiveRecord::Base
  belongs_to :user
  has_many :bookings

  def find_bookings
    Booking.where(property_id: id, booking_status: 'pending').or(Booking.where(property_id: id, booking_status: 'confirmed')).reverse_order
  end

  def dates_booked
    bookings = Booking.where(property_id: self.id, booking_status: 'confirmed')
    dates = []
    bookings.each do |booking|
      date_out = ((booking.check_out)-1)
      (booking.check_in..date_out).each do |date|
        dates << date
      end
    end
    dates
  end

  def dates_booked_strings
    dates = dates_booked
    dates_s = []
    dates.map do |date|
      dates_s << date.strftime('%F')
    end
    p dates_s
  end

  def max_date(check_in)
    dates = dates_booked
    dates << check_in
    p dates.sort_by
    index = dates.index(check_in)
    dates[index+1]
  end
  
  def self.booked_check(properties, check_in, check_out)
    available_props = []
    properties.each do |property|
      date_out = (Date.parse(check_out)-1).strftime('%F')
      dates = property.dates_booked_strings
      unless dates.include?(check_in) || dates.include?(date_out)
        available_props << property
      end
    end
    available_props
  end

end
