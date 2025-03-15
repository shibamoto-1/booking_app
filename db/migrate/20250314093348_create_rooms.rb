class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :image
      t.string :introduction
      t.string :address
      t.integer :fee

      t.timestamps
    end
  end
end
