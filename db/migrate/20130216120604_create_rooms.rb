class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.integer :host_id
      t.integer :capacity

      t.timestamps
    end

    add_index :rooms, :host_id
  end
end
