require 'active_record'

class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :property
end