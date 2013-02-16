class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :room_id
      t.date :start_date
      t.date :end_date
      t.integer :number_of_guests

      t.timestamps
    end
  end
end
