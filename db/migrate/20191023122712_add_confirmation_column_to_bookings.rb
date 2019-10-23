class AddConfirmationColumnToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :booking_status, :string, null: false
  end
end
