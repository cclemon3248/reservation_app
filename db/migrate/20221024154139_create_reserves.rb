class CreateReserves < ActiveRecord::Migration[6.1]
  def change
    create_table :reserves do |t|
      t.datetime :start
      t.datetime :end
      t.integer :people
      t.references :room, null: false, foreign_key: true
      t.timestamps
    end
  end
end
