# frozen_string_literal: true

require 'active_record'

class Property < ActiveRecord::Base
  belongs_to :user
  has_many :bookings

  def find_bookings
    Booking.where(property_id: id, booking_status: 'pending').or(Booking.where(property_id: id, booking_status: 'confirmed')).reverse_order
  end

  def self.featured_three
    Property.all.sample(3)
  end

  def dates_booked
    bookings = Booking.where(property_id: id, booking_status: 'confirmed')
    dates = []
    bookings.each do |booking|
      date_out = (booking.check_out - 1)
      (booking.check_in..date_out).each do |date|
        dates << date.strftime('%F')
      end
    end
    dates
  end

  def self.booked_check(properties, check_in, check_out)
    available_props = []
    properties.each do |property|
      date_out = (Date.parse(check_out) - 1).strftime('%F')
      dates = property.dates_booked
      unless dates.include?(check_in) || dates.include?(date_out)
        available_props << property
      end
    end
    available_props
  end
end
