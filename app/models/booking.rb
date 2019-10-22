require 'active_record'

class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :property

  def find_property
    Property.find(self.property_id)
  end
end
