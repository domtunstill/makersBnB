require 'active_record'

class Property < ActiveRecord::Base
  belongs_to :user
  has_many :bookings

  def find_bookings
    Booking.where(property_id: self.id, booking_status: 'pending').or(Booking.where(property_id: self.id, booking_status: 'confirmed')).reverse_order
  end

end
