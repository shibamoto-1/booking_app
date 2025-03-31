class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name, null: false
      t.string :introduction, null: false
      t.string :address, null: false
      t.integer :fee, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :rooms, :name
  end
end
