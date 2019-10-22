class AddAvailabilityDatesToProperties < ActiveRecord::Migration[6.0]
  def change
    add_column :properties, :available_from, :date
    add_column :properties, :available_to, :date
  end
end
