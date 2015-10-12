class AddPriceToPizza < ActiveRecord::Migration
  def change
    add_column :pizzas, :price, :float
  end
end
