class RemoveImageFromRoomsAndUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :rooms, :image, :string
    remove_column :users, :image, :string
  end
end
