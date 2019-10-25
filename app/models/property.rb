require 'active_record'

class Property < ActiveRecord::Base
  belongs_to :user
  has_many :bookings

  def find_landlord
    User.find(self.user_id)
  end
end
