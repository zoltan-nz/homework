class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.integer :host_id
      t.integer :capacity

      t.timestamps
    end
  end
end
