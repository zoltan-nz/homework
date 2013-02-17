class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.date :s_date
      t.date :e_date
      t.integer :n_guests

      t.timestamps
    end
  end
end
