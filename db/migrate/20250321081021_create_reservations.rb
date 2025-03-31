class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.date :check_in_date, null:false
      t.date :check_out_date, null:false
      t.integer :member_count, null:false
      t.references :user, null:false, forein_key: true
      t.references :room, null:false, forein_key: true

      t.timestamps
    end
  end
end
