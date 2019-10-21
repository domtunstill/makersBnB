require 'active_record'

class Property < ActiveRecord::Base
  belongs_to :user
  has_many :bookings
end