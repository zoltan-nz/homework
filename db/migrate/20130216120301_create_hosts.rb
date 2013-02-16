class CreateHosts < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
      t.string :name
      t.text :address

      t.timestamps
    end

    add_index :hosts, :name
  end
end
