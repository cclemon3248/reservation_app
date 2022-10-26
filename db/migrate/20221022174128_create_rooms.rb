class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.text :content
      t.integer :price
      t.string :address
      t.text :image
      t.timestamps
    end
  end
end
