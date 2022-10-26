class AddPriceToReserves < ActiveRecord::Migration[6.1]
  def change
    add_column :reserves, :price, :integer
  end
end
