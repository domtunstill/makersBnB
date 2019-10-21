class CreateUsersAndProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false, unique: true
      t.string :password_digest, null: false
    end
    create_table :properties do |t|
      t.belongs_to :user, index: true
      t.string :name, null: false
      t.string :description, null: false
      t.integer :price_per_night, null: false
      t.boolean :booked
      t.string :image
    end
    create_table :bookings do |t|
      t.belongs_to :property, index: true
      t.belongs_to :user, index: true
      t.date       :check_in, null: false
      t.date       :check_out, null: false
      t.string :image
    end
  end
end
