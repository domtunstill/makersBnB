require 'active_record'

class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :property

  def find_property
    Property.find(self.property_id)
  end

  def find_guest
    User.find(self.user_id)
  end

end
