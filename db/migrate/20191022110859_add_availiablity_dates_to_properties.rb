class AddAvailiablityDatesToProperties < ActiveRecord::Migration[6.0]
  def change
    add_column :properties, :availiable_from, :date
    add_column :properties, :availiable_to, :date
  end
end
