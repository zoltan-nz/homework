class CreateBeds < ActiveRecord::Migration
  def change
    create_table :beds do |t|
      t.string :room_id

      t.timestamps
    end
  end
end
